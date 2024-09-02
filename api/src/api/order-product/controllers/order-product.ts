/**
 * order-product controller
 */

import { factories } from '@strapi/strapi';

export default factories.createCoreController(
  'api::order-product.order-product',
  ({ strapi }) => ({
    async create(ctx) {
      // 打印整个请求体
      console.log(
        'Received full request body:',
        JSON.stringify(ctx.request.body, null, 2)
      );

      // 打印请求头（可选，但有时很有用）
      console.log(
        'Request headers:',
        JSON.stringify(ctx.request.headers, null, 2)
      );

      // 提取数据
      const { data } = ctx.request.body;

      // 打印提取的数据
      console.log('Extracted data:', JSON.stringify(data, null, 2));

      try {
        let result = await strapi.entityService.create(
          'api::order-product.order-product',
          {
            data: ctx.request.body.data,
            populate: ['product'],
          }
        );

        console.log('Created order-product:', JSON.stringify(result, null, 2));

        // 立即发布记录
        result = await strapi.entityService.update(
          'api::order-product.order-product',
          result.id,
          {
            data: {
              publishedAt: new Date(),
            },
            populate: ['product'],
          }
        );

        console.log(
          'Published order-product:',
          JSON.stringify(result, null, 2)
        );
        return { data: result };
      } catch (error) {
        // 错误处理
        console.error('Error creating order-product:', error);
        ctx.throw(500, error);
      }
    },
  })
);
