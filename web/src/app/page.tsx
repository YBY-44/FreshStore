'use client';
import React, { useEffect, useState } from 'react';
import { Advertise } from '../_componments/advertise';
import { Slider } from '../_componments/Slider';
import GlobalAPI from '../_utils/GlobalAPI';
import { Category, ProductType, BannerType, SliderType } from '../types';
import { ProductListComp } from '@/_componments/ProductListComp';
import { CategoryListComp } from '@/_componments/CategoryListComp';
import { set } from 'react-hook-form';
import { useAuth } from '../_componments/AuthProvider';
import { useSearch } from '../_context/SearchContext';
export default function Home() {
  const { search, updateSearch } = useSearch();
  const [ProductList, setProductList] = useState<ProductType[]>([]);
  const [CategoryList, setCategoryList] = useState<Category[]>([]);
  const [SliderList, setSliderList] = useState<SliderType[]>([]);
  const [loading, setLoading] = useState(true);
  const [loading_b, setLoadingB] = useState(true);
  const [loading_s, setLoadingS] = useState(true);
  const {isLogin} = useAuth();
  const GetBannerAndSliderList = () => {
    GlobalAPI.getSliders()
      .then((resp) => {
        const res = resp.data.data;
        const sliderList = res.filter((slider: SliderType) => {
          return slider.attributes.Type === 'Home';
        });
        setSliderList(sliderList);
        setLoadingS(false);
        return resp.data.data;
      })
      .catch((err) => {
        setLoadingS(false);
        return [];
      });
  };
  const categoryList = () => {
    GlobalAPI.getCategory()
      .then((resp) => {
        setCategoryList(resp.data.data);
        setLoadingB(false);
        return resp.data.data;
      })
      .catch((err) => {
        setCategoryList([]);
        setLoadingB(false);
        return [];
      });
  };
  const GetProductList = () => {
    GlobalAPI.SearchProduct(search || '')
      .then((resp) => {
        setProductList(resp.data.data);
        setLoading(false);
        return resp.data.data;
      })
      .catch((err) => {
        setProductList([]);
        setLoading(false);
        return [];
      });
  };
  useEffect(() => {
    GetProductList();
    categoryList();
    GetBannerAndSliderList();
  }, [search]);
  return (
    <div className='flex flex-col'>
      {!isLogin && <Advertise />}
      <Slider SliderList={SliderList} loading={loading_s} />
      <CategoryListComp
        CategoryList={CategoryList}
        top={true}
        loading={loading_b}
      />
      <ProductListComp ProductList={ProductList} loading={loading} />
    </div>
  );
}
