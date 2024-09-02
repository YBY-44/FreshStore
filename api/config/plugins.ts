module.exports = {
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
  };
  