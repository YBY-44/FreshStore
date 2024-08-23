'use client';
import React, { useEffect, useState } from 'react';
import Image from 'next/image';
import { LayoutGrid, Search } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { ShoppingBasket } from 'lucide-react';
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import GlobalAPI from '../_utils/GlobalAPI';
import { Category } from '../types';
import Link from 'next/link';
export const Header = () => {
  const [CategoryList, setCategoryList] = useState<Category[]>([]);
  const categoryList = () => {
    GlobalAPI.getCategory()
      .then((resp) => {
        setCategoryList(resp.data.data);
        return resp.data.data;
      })
      .catch((err) => {
        console.log(err);
        setCategoryList([]);
        return [];
      });
  };
  useEffect(() => {
    categoryList();
  }, []);
  return (
    <div className='fixed z-10 justify-between flex items-center gap-3 shadow-xl w-full px-5 bg-white'>
      <Link href='/'>
        <Image
          src={'/LOGO.png'}
          alt='logo'
          className='p-0 my-2'
          width={50}
          height={50}
          style={{ height: 'auto', width: 'auto' }}
          priority
        />
      </Link>
      <div className='bg-gray-200 flex items-center rounded-full h-min item-center py-2 px-5 justify-center hover:bg-gray-300 cursor-pointer'>
        <DropdownMenu>
          <DropdownMenuTrigger className='outline-none flex' asChild>
            <h2 className='flex text-md px-2 items-center gap-2'>
              <LayoutGrid className='h-5 w-5' />
              Category
            </h2>
          </DropdownMenuTrigger>
          <DropdownMenuContent>
            <DropdownMenuLabel>All Category</DropdownMenuLabel>
            <DropdownMenuSeparator />
            {CategoryList?.map((category) => {
              const imageUrl =
                process.env.NEXT_PUBLIC_ICON_URL +
                  category.attributes.icon?.data?.[0]?.attributes?.url || '';
              const resultname = category.attributes.name
                .split(' ')
                .join('')
                .split('&')
                .join('');
              return (
                <Link href={'/' + resultname} key={category.id}>
                  <DropdownMenuItem className='px-4 flex gap-4 cursor-pointer items-center'>
                      <Image
                        className='rounded-md'
                        unoptimized={true}
                        width={60}
                        height={60}
                        src={imageUrl}
                        alt={category.attributes.name || ''}
                        style={{ height: 'auto' }}
                        priority
                      />
                      <h2 className='text-lg'>{category.attributes.name}</h2>
                  </DropdownMenuItem>
                </Link>
              );
            })}
          </DropdownMenuContent>
        </DropdownMenu>
      </div>

      <div className='hidden sm:flex w-[calc(100vw-350px)] items-center border rounded-full item-center py-2 px-2'>
        <Search className='h-5 w-5' />
        <input
          type='text`'
          className='flex text-md px-2 outline-none w-full'
          placeholder='What to but?'
        />
      </div>

      <div className='flex items-center gap-2'>
        <div className='flex gap-1'>
          <ShoppingBasket />
          <div>0</div>
        </div>
        <Button variant='default' className=''>
          Login
        </Button>
        {/* <Button variant='default' className=''>Regist</Button> */}
      </div>
    </div>
  );
};
export default Header;
