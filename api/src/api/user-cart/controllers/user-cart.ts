/**
 * user-cart controller
 */

import { factories } from '@strapi/strapi';

export default factories.createCoreController(
  'api::user-cart.user-cart',
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
          'api::user-cart.user-cart',
          {
            data: ctx.request.body.data,
            populate: ['product', 'users_permissions_user'],
          }
        );

        console.log('Created user-cart:', JSON.stringify(result, null, 2));

        // 立即发布记录
        result = await strapi.entityService.update(
          'api::user-cart.user-cart',
          result.id,
          {
            data: {
              publishedAt: new Date(),
            },
            populate: ['product', 'users_permissions_user'],
          }
        );

        console.log('Published user-cart:', JSON.stringify(result, null, 2));
        return { data: result };
      } catch (error) {
        // 错误处理
        console.error('Error creating user-cart:', error);
        ctx.throw(500, error);
      }
    },
  })
);
