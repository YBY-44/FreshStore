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
import Link from 'next/link';
export const CategoryListComp = ({
  CategoryList,
  Current,
  top = false,
  loading,
}: {
  CategoryList: Category[];
  Current?: string;
  top?: boolean;
  loading: boolean;
}) => {
  return (
    <div className='w-full flex flex-col px-5'>
      {top && (
        <h2 className='text-green-600 font-bold text-2xl'>Shop By Category</h2>
      )}
      {loading && (
        <div className='flex items-center justify-center p-10 h-[300px]'>
          <Loader className='h-10 w-10 animate-spin' />
        </div>
      )}
      <div className='p-5 gap-8 grid grid-cols-2 sm:grid-cols-3 md:grid-cols-6 xl:grid-cols-8 '>
        {CategoryList?.map((category) => {
          return (
            <Link
              key={category.id}
              href={
                '/' +
                category.attributes.name.split(' ').join('').split('&').join('')
              }
            >
              <div
                className={
                  'text-green-800 hover:text-white shadow-md bg-green-50 flex flex-col sm:text-sm md:text-md lg:text-lg hover:font-bold transition-all hover:scale-110 duration-300 ease-in-out hover:bg-green-800 hover:rounded-md' +
                  (Current === category.attributes.name
                    ? ' font-bold bg-green-600 scale-110 text-white rounded-md'
                    : '')
                }
              >
                <Image
                  src={
                    process.env.NEXT_PUBLIC_ICON_URL +
                      category.attributes.icon.data[0].attributes.url || ''
                  }
                  className='mb-1 rounded-t-md w-full h-20 object-cover shadow-sm cursor-pointer '
                  alt={category.attributes.name || ''}
                  width={500}
                  height={500}
                  priority
                />
                <div className='my-2 flex justify-center text-ellipsis text-nowrap '>
                  {category.attributes.name}
                </div>
              </div>
            </Link>
          );
        })}
      </div>
    </div>
  );
};
