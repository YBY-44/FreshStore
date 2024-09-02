import { factories } from '@strapi/strapi';
import Stripe from 'stripe';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!, {
  apiVersion: '2024-06-20',
});

export default factories.createCoreController(
  'api::order.order',
  ({ strapi }) => {
    return {
      // 自定义的创建订单方法
      async create(ctx: any) {
        // 打印整个请求体
        console.log(
          'Received full request body:',
          JSON.stringify(ctx.request.body, null, 2)
        );

        // 提取数据
        const { data } = ctx.request.body;

        // 打印提取的数据
        console.log('Extracted data:', JSON.stringify(data, null, 2));

        try {
          let result = await strapi.entityService.create('api::order.order', {
            data: ctx.request.body.data,
            populate: ['users_permissions_user', 'OrderItemList'],
          });

          console.log('Created order:', JSON.stringify(result, null, 2));

          // 立即发布记录
          result = await strapi.entityService.update(
            'api::order.order',
            result.id,
            {
              data: {
                publishedAt: new Date(),
              },
              populate: ['users_permissions_user', 'OrderItemList'],
            }
          );

          console.log('Published order:', JSON.stringify(result, null, 2));
          return { data: result };
        } catch (error) {
          // 错误处理
          console.error('Error creating order:', error);
          ctx.throw(500, error);
        }
      },

      // 自定义的创建支付会话方法
      async createPaymentSession(ctx: any) {
        const { amount, orderId } = ctx.request.body;

        try {
          const session = await stripe.checkout.sessions.create({
            payment_method_types: ['card'],
            line_items: [
              {
                price_data: {
                  currency: 'usd',
                  product_data: {
                    name: 'Order Payment',
                  },
                  unit_amount: amount * 100, // amount in cents
                },
                quantity: 1,
              },
            ],
            mode: 'payment',
            success_url: `${process.env.CLIENT_URL}?session_id={CHECKOUT_SESSION_ID}&order_id=${orderId}`,
            cancel_url: `${process.env.CAMCEL_URL}`,
          });

          ctx.send({ id: session.id });
        } catch (error) {
          // 错误处理
          console.error('Error creating payment session:', error);
          ctx.throw(500, error);
        }
      },

      // 自定义的更新订单方法
      async update(ctx: any) {
        // 获取订单 ID
        const orderId = ctx.params.id;

        // 打印订单 ID 和请求体
        console.log('Updating order with ID:', orderId);
        console.log(
          'Received update request body:',
          JSON.stringify(ctx.request.body, null, 2)
        );

        // 提取更新数据
        const { data } = ctx.request.body;

        // 打印提取的数据
        console.log(
          'Extracted data for update:',
          JSON.stringify(data, null, 2)
        );

        try {
          // 使用 entityService 更新订单记录
          let result = await strapi.entityService.update(
            'api::order.order',
            orderId,
            {
              data: ctx.request.body.data,
              populate: ['users_permissions_user', 'OrderItemList'], // 可选：如果需要返回关联的数据
            }
          );

          console.log('Updated order:', JSON.stringify(result, null, 2));

          // 返回更新后的数据
          return { data: result };
        } catch (error) {
          // 错误处理
          console.error('Error updating order:', error);
          ctx.throw(500, error);
        }
      },

      

      async find(ctx: any) {
        try {
          const { id } = ctx.params; // Retrieve the ID from the request parameters, if it exists
          const filters = ctx.query.filters || {}; // Retrieve any existing filters from the query

          // If an ID is provided, add it to the filters
          if (id) {
            filters.id = id;
          }

          // Query orders based on the provided filters
          const orders = await strapi.entityService.findMany(
            'api::order.order',
            {
              filters: filters,
              populate: {
                OrderItemList: {
                  populate: {
                    product: {
                      populate: {
                        Images: true,
                      },
                    },
                  },
                },
              },
            }
          );

          // Return the orders
          ctx.send(orders);
        } catch (error) {
          ctx.throw(500, 'An error occurred while fetching orders');
        }
      },
    };
  }
);
