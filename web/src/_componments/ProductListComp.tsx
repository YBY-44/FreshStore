'use client';
import React, { useEffect, useState } from 'react';
import Image from 'next/image';
import { LayoutGrid, Search } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { ShoppingBasket } from 'lucide-react';
import GlobalAPI from '../_utils/GlobalAPI';
import { ProductType, Category } from '../types';
import { ProductCard } from './ProductCard';
import { Loader } from 'lucide-react';

export const ProductListComp = ({
  ProductList,
  loading,
}: {
  ProductList: ProductType[];
  loading: boolean;
}) => {
  return (
    <div className='mt-10'>
      <h2 className='text-green-600 font-bold text-2xl p-5'>
        Most Popular Products
      </h2>
      {loading && (
        <div className='flex flex-col items-center gap-10'>
          <Loader className='h-20 w-20 animate-spin' />
          <h2 className='text-3xl'>LOADING...</h2>
        </div>
      )}
      {ProductList.length === 0 && !loading && (
        <div className='flex flex-col items-center gap-10'>
          <h2 className='text-3xl'>NOT FOUND</h2>
          <h2 className='text-center text-2xl bg-gray-200 p-10 rounded-md'>
            Sorry, We currently have no product for such item, You can tell your
            requirement by contact us, it would comming soon.
          </h2>
        </div>
      )}
      <div className='p-5 grid grid-cols-none sm:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-4 gap-8'>
        {ProductList?.map((product, index) => {
          console.log('imageUrl: ', product);
          const imageUrl =
              product.attributes.Images?.data[0]?.attributes?.url || '';
          return (
            <ProductCard key={index} product={product} imageUrl={imageUrl} />
          );
        })}
      </div>
    </div>
  );
};
