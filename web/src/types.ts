export interface Image {
  id: number;
  attributes: {
    url: string;
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
    Image:{data: Image};
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
      Image:{data: Image};
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
export interface registerType {
  Username: string;
  Email: string;
  Password: string;
}
