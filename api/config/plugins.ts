// console.log(process.env.CLOUDINARY_CLOUD_NAME);
// console.log(process.env.CLOUDINARY_API_KEY);
// console.log(process.env.CLOUDINARY_API_SECRET);
module.exports =({env})=> ({
  // 配置电子邮件插件
  email: {
    config: {
      providerOptions: {
        service: 'gmail', // 使用 Gmail 服务
        auth: {
          user: 'boyangyby@gmail.com', // 替换为你的 SMTP 服务器用户名
          pass: 'bihz wcsl owsw zzdy', // 替换为你的 SMTP 服务器密码
        },
      },
      settings: {
        defaultFrom: 'FreshSolder <no-reply@FreshSolder.io>', // 默认发件人电子邮件
        defaultReplyTo: 'FreshSolder <example@FreshSolder.io>', // 默认回复电子邮件
      },
    },
  },
  upload: {
    config:{
        provider: 'cloudinary',
        providerOptions: {
          cloud_name: env('CLOUDINARY_CLOUD_NAME'),
          api_key: env('CLOUDINARY_API_KEY'),
          api_secret: env('CLOUDINARY_API_SECRET'),
        },
        actionOptions: {
          upload: {},
          delete: {},
        },
    }
    
  },
});
