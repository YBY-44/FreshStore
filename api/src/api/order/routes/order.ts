// path: ./src/api/order/routes/order.ts

import { factories } from '@strapi/strapi';

// export default factories.createCoreRouter('api::order.order', {
//   config: {
//     // 定义自定义路由
//     'POST /orders/create-payment-session': {
//       handler: 'order.createPaymentSession',
//       config: {
//         policies: [],
//         middlewares: [],
//       },
//     },
//     // 可以在这里添加更多自定义路由
//   } as any,
// });

module.exports = {
    routes: [
      {
        method: 'POST',
        path: '/orders/create-payment-session',
        handler: 'order.createPaymentSession',
        config: {
          policies: [],
          middlewares: [],
        },
      },
      {
        method: 'POST',
        path: '/orders',
        handler: 'order.create',
        config: {
            policies: [],
            middlewares: [],
        }
      },
      {
        method: 'PUT',
        path: '/orders/:id',
        handler: 'order.update',
        config: {
            policies: [],
            middlewares: [],
        }
      }
      ,{
        method: 'GET',
        path: '/orders/:id?',
        handler: 'order.find',
        config: {
            policies: [],
            middlewares: [],
        }
      }
      // ... other routes
    ],
  };
