'use client';
import React, { useEffect, useState } from 'react';
import GlobalAPI from '../../_utils/GlobalAPI';
import { Category, ProductType, BannerType, SliderType } from '../../types';
import { ProductListComp } from '@/_componments/ProductListComp';
import { CategoryBanner } from '@/_componments/CategoryBanner';
import { CategoryListComp } from '@/_componments/CategoryListComp';
import { useSearch } from '../../_context/SearchContext';

export default function Home() {
  const curPage = 'MilkJuice';
  const { search } = useSearch();
  const [ProductList, setProductList] = useState<ProductType[]>([]);
  const [CategoryList, setCategoryList] = useState<Category[]>([]);
  const [loading, setLoading] = useState(true);
  const [loading_b, setLoadingB] = useState(true);
  const getCategoryList = () => {
    GlobalAPI.getCategory()
      .then((resp) => {
        setCategoryList(resp.data.data);
        setLoadingB(false);
        return resp.data.data;
      })
      .catch((err) => {
        console.log(err);
        setLoadingB(false);
        setCategoryList([]);
        return [];
      });
  };
  const GetProductList = () => {
    GlobalAPI.getProductsByCategory(curPage, search || '')
      .then((resp) => {
        setProductList(resp.data.data);
        setLoading(false);
        return resp.data.data;
      })
      .catch((err) => {
        console.log(err);
        setProductList([]);
        return [];
      });
  };
  useEffect(() => {
    GetProductList();
    getCategoryList();
  }, [search]);
  return (
    <div className='flex flex-col w-full'>
      <CategoryBanner text={curPage} />
      <div className='hidden lg:block'>
        <CategoryListComp CategoryList={CategoryList} Current={curPage} loading={loading_b}/>
      </div>
      <ProductListComp ProductList={ProductList} loading={loading}/>
    </div>
  );
}
