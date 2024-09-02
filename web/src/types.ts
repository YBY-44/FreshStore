export interface Image {
  id: number;
  attributes: {
    url: string;
  };
}
export interface ImageSmall {
  id: number;
  attributes: {
    formats: {
      small: {
        url: string;
      };
    };
  };
}
export interface Category {
  id: number;
  attributes: {
    name: string;
    id: number;
    color: string;
    publishedAt: string;
    createdAt: string;
    icon: { data: Image[] };
  };
}
export interface SliderType {
  id: number;
  attributes: {
    Sname: string;
    id: number;
    Type: 'Home' | 'Banner';
    publishedAt: string;
    createdAt: string;
    Image: { data: Image };
  };
}
export interface BannerType {
  id: number;
  attributes: {
    Sname: string;
    id: number;
    Type: 'Home' | 'Banner';
    publishedAt: string;
    createdAt: string;
    Image: { data: Image };
  };
}
export interface ProductType {
  id: number;
  attributes: {
    name: string;
    PID: string;
    Price: number;
    QT: string;
    describtion: string;
    mrp: number;
    Images: { data: Image[] };
    categories: {
      data: Category[];
    };
  };
}
export interface ProductTypewithSmall {
  id: number;
  attributes: {
    name: string;
    PID: string;
    Price: number;
    QT: string;
    describtion: string;
    mrp: number;
    Images: { data: ImageSmall[] };
    categories: {
      data: Category[];
    };
  };
}
export interface registerType {
  Username: string;
  Email: string;
  Password: string;
}
export interface loginType {
  email: string;
  password: string;
}
export interface UserType {
  email: string;
  username: string;
  id: number;
}

export interface CardType {
  data: {
    quantity: number;
    amount: number;
    product: string;
    users_permissions_user: number;
    UserId: number;
  };
}
export interface CartItem {
  id: number;
  attributes: {
    quantity: number;
    amount: number;
    product: { data: ProductType };
  };
}
export interface OrderItem {
  OrderId: number;
  productId: number;
  amount: number;
  totalPrice: number;
}
export interface OrderType {
  name: string;
  email: string;
  phone: string;
  postCode: string;
  address: string;
  time: string;
  slot: string;
  UserId: number;
  totalPrice: number;
  status: string;
  Subtotal: number;
  DeliveryPrice: number;

  products: {
    product: number;
    quantity: number;
    TotalPrice: number;
  }[];
  GST: number;
}

export interface OrderTypeWithId {
  Subtotal: number;
  DeliveryPrice: number;
  GST: number;
  id: number;
  CostumerEmail: string;
  CostumerName: string;
  Duration: 'O' | 'A' | 'M' | 'N';
  ExpectDay: string;
  OrderAddress: string;
  OrderItemList: {
    TotalPrice: number;
    id: number;
    quantity: number;
    product: {
      Images: { url: string }[];
      PID: string;
      Price: number;
      QT: string;
      describtion: string;
      id: number;
      mrp: number;
      name: string;
    };
  }[];
  Phone: string;
  Postcode: string;
  TotalPrice: number;
  UserId: number;
  CancelTime: string;
  DeliverTime: string;
  PaidTime: string;
  PickedTime: string;
  status:
    | 'Ordered'
    | 'Delivered'
    | 'Unpaid'
    | 'Delivering'
    | 'Cancelled'
    | 'Finished';
  createdAt: string;
}

export interface UserInformation {

blocked: boolean;

confirmed: boolean;
createdAt: string;
email: string;
id: number;
provider: string;
updatedAt: string;
username: string;
}