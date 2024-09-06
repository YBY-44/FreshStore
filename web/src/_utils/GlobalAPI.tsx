import {
  registerType,
  loginType,
  CardType,
  OrderType,
  OrderItem,
} from '@/types';
const { default: axios } = require('axios');

const axiosClient = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_URL,
});

const SearchProduct = async (search: string) => {
  return await axiosClient.get(
    `/products?filters[name][$containsi]=${search}&populate=*`
  );
};

const getProfile = async (jwt: string) => {
  return await axiosClient.get('/users/me', {
    headers: {
      Authorization: `Bearer ${jwt}`,
    },
  });
};
const editProfile = async (
  jwt: string,
  data: { username: string; email: string },
  id: number
) => {
  console.log('data: ', data);
  return await axiosClient.put(
    `/users/${id} `,
    {

        username: data.username,
        email: data.email,
    },
    {
      headers: {
        Authorization: `Bearer ${jwt}`,
      },
    }
  );
};

const getCategory = async () => {
  return await axiosClient.get('/categories?populate=*');
};
const getSliders = async () => {
  return await axiosClient.get('/sliders?populate=*');
};
const getProducts = async () => {
  return await axiosClient.get('/products?populate=*');
};
const getProductsByCategory = async (category: string, name: string) => {
  return await axiosClient.get(
    `/products?filters[name][$containsi]=${name}&filters[categories][name][$in]=${category}&populate=*`
  );
};
const register = async (data: registerType) => {
  console.log('data: ', data);
  return await axiosClient.post('/auth/local/register', {
    username: data.Username,
    email: data.Email,
    password: data.Password,
  });
};

const login = async (data: loginType) => {
  return axiosClient.post('/auth/local', {
    identifier: data.email,
    password: data.password,
  });
};

const addToCart = async (data: CardType, jwt: string) => {
  console.log('data: ', data);
  return axiosClient.post('/user-carts', data, {
    headers: {
      Authorization: `Bearer ${jwt}`,
    },
  });
};

const deleteToCart = async (id: number, jwt: string) => {
  console.log('id: ', id);
  return await axiosClient.delete(`/user-carts/${id}`, {
    headers: {
      Authorization: `Bearer ${jwt}`,
    },
  });
};
const CartNumber = async (id: number, jwt: string) => {
  return axiosClient.get(
    `/user-carts?filters[UserId][$eq]=${id}&populate[product][populate][Images]=*`,
    {
      headers: {
        Authorization: `Bearer ${jwt}`,
      },
    }
  );
};

const AddOrder = async (data: OrderType, jwt: string) => {
  console.log('new: ', data);
  return axiosClient.post(
    '/orders',
    {
      data: {
        CostumerName: data.name,
        CostumerEmail: data.email,
        OrderAddress: data.address,
        Postcode: data.postCode,
        Phone: data.phone,
        ExpectDay: data.time,
        Duration: data.slot,
        TotalPrice: data.totalPrice,
        users_permissions_user: data.UserId,
        UserId: data.UserId,
        OrderItemList: data.products,
        status: data.status,
        Subtotal: data.Subtotal,
        DeliveryPrice: data.DeliveryPrice,
        GST: data.GST,
      },
    },
    {
      headers: {
        Authorization: `Bearer ${jwt}`,
      },
    }
  );
};
const OrderDetailChange = async (
  id: number,
  jwt: string,
  data: {
    CostumerName: string;
    CostumerEmail: string;
    OrderAddress: string;
    Phone: string;
    ExpectDay: string;
    Duration: string;
  }
) => {
  return axiosClient.put(
    `/orders/${id}`,
    {
      data,
    },
    {
      headers: {
        Authorization: `Bearer ${jwt}`,
      },
    }
  );
};
const OrderStatusChange = async (
  id: number,
  jwt: string,
  data: {
    status: string;
    CancelTime?: string;
    DeliveryTime?: string;
    PaidTime?: string;
    PickedTime?: string;
  }
) => {
  return axiosClient.put(
    `/orders/${id}`,
    {
      data,
    },
    {
      headers: {
        Authorization: `Bearer ${jwt}`,
      },
    }
  );
};
const MakePayment = async (
  data: { amount: number; orderId: number },
  jwt: string
) => {
  console.log('api: ', data.amount);
  return axiosClient.post('/orders/create-payment-session', {
    amount: Math.round(data.amount * 100),
    orderId: data.orderId,
  }, {
    headers: {
      Authorization: `Bearer ${jwt}`,
    },
  });
};
const AddOrderItem = async (data: OrderItem, jwt: string) => {
  return axiosClient.post(
    '/order-products',
    {
      data: {
        order: data.OrderId,
        product: data.productId,
        amount: data.amount,
        TotalPrice: data.totalPrice,
      },
    },
    {
      headers: {
        Authorization: `Bearer ${jwt}`,
      },
    }
  );
};

const GetMyOrders = async (id: number, jwt: string) => {
  return axiosClient.get(
    `/orders?filters[UserId][$eq]=${id}&populate=[OrderItemList][populate][product][populate][Images]=*`,
    {
      headers: {
        Authorization: `Bearer ${jwt}`,
      },
    }
  );
};
const GetOneOrder = async (id: number, jwt: string) => {
  return axiosClient.get(
    `/orders/${id}?&populate=[OrderItemList][populate][product][populate][Images]=*`,
    {
      headers: {
        Authorization: `Bearer ${jwt}`,
      },
    }
  );
};

const sendEmail = async (email: string) => {
  return axiosClient.post('/auth/forgot-password', { email });
};
const ResetPassword = async (data: {
  code: string;
  password: string;
  passwordConfirmation: string;
}) => {
  return axiosClient.post('/auth/reset-password', data);
};
const GlobalAPI = {
  getCategory,
  getSliders,
  getProducts,
  getProductsByCategory,
  register,
  login,
  addToCart,
  deleteToCart,
  CartNumber,
  AddOrder,
  AddOrderItem,
  MakePayment,
  OrderStatusChange,
  GetMyOrders,
  GetOneOrder,
  SearchProduct,
  getProfile,
  editProfile,
  sendEmail,
  ResetPassword,
  OrderDetailChange
};

export default GlobalAPI;
