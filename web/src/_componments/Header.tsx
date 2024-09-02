'use client';
import React, { useEffect, useState } from 'react';
import Image from 'next/image';
import { LayoutGrid, Search, CircleX, Loader, Car } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { ShoppingBasket } from 'lucide-react';
import { CircleUserRound } from 'lucide-react';
import { ProfileChoice } from '../_utils/constants';
import { toast } from '../_utils/Toast';
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import GlobalAPI from '../_utils/GlobalAPI';
import { CardType, Category, CartItem } from '../types';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useAuth } from '../_componments/AuthProvider';
import { parseCookies } from 'nookies';
import { eventBus } from '../_utils/event';
import { getCartNumber } from '../_componments/ProductSpecificCard';
import { set } from 'react-hook-form';
import { on } from 'events';
import { useSearch } from '../_context/SearchContext';
export const calculateTotalPrice = (
  CartArray: CartItem[],
  setTotalPrice: React.Dispatch<React.SetStateAction<number>>
) => {
  const res = CartArray.reduce((acc, item) => {
    return acc + item.attributes.amount;
  }, 0);
  setTotalPrice(res);
};
export const deleteFromCart = (
  event: React.MouseEvent<HTMLButtonElement>,
  CartInfo: CartItem[],
  setCartInfo: React.Dispatch<React.SetStateAction<CartItem[]>>,
  setTotalPrice: React.Dispatch<React.SetStateAction<number>>,
  id: number,
  jwt: string,
  setLoadin?: React.Dispatch<React.SetStateAction<boolean>>
) => {
  const newCart = CartInfo.filter((cart) => cart.id !== id);
  if (setLoadin) setLoadin(true);
  setCartInfo(newCart);
  GlobalAPI.deleteToCart(id, jwt)
    .then(() => {
      calculateTotalPrice(newCart, setTotalPrice);
      if (setLoadin) setLoadin(false);
    })
    .catch((err) => {
      toast.error('Error in deleting item from cart, please refresh');
      if (setLoadin) setLoadin(false);
    });
  event.stopPropagation();
};
export const Header = () => {
  const { search, updateSearch } = useSearch();
  const [CartInfo, setCartInfo] = useState<CartItem[]>([]);
  const [totalPrice, setTotalPrice] = useState<number>(0);
  const [loading, setLoading] = useState<boolean>(true);
  const cookies = parseCookies();
  const { user, jwt } = cookies;
  const { isLogin, logout } = useAuth();
  const pathname = usePathname();
  const router = useRouter();
  const [isCheckout, setIsCheckout] = useState(false);
  useEffect(() => {
    setIsCheckout(pathname === '/Checkout');
    setLoading(true);
    const initializeCart = async () => {
      if (!user || !jwt) {
        setLoading(false);
        return [];
      }
      const initialCart = await getCartNumber(user, jwt)
        .then((resp) => {
          setLoading(false);
          calculateTotalPrice(resp, setTotalPrice);
          return resp;
        })
        .catch((err) => {
          setLoading(false);
          return [];
        });
      setCartInfo(initialCart);
    };
    initializeCart();
  }, [pathname]);
  const [CategoryList, setCategoryList] = useState<Category[]>([]);
  const categoryList = () => {
    GlobalAPI.getCategory()
      .then((resp) => {
        console.log(resp.data.data);
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
  useEffect(() => {
    const handleCartAdded = async (newCart: CartItem[]) => {
      setCartInfo(newCart);
      calculateTotalPrice(newCart, setTotalPrice);
    };
    eventBus.on('ItemAdded', handleCartAdded);
    // 在组件卸载时取消订阅事件
    return () => {
      eventBus.off('orderAdded', handleCartAdded);
    };
  }, []);
  const SignOut = async () => {
    await logout();
    router.push('/');
  };
  const onSearch = (e: React.ChangeEvent<HTMLInputElement>) => {
    sessionStorage.setItem('search', e.target.value);
    updateSearch(e.target.value);
  };
  return (
    <div
      className={
        'fixed z-50 w-full bg-white justify-between flex items-center gap-3 shadow-xl pl-4 pr-3 ' +
        (isLogin ? '' : 'border-b')
      }
    >
      <Link href='/'>
        <Image
          src={'/LOGO.png'}
          alt='logo'
          className='p-0 my-2 object-cover'
          width={50}
          height={50}
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
                category.attributes.icon?.data[0]?.attributes?.url || '';
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
          onChange={onSearch}
          value={search || ''}
        />
      </div>

      <div className='flex items-center gap-2 justify-center'>
        {isCheckout ? (
          <Link
            href='/'
            className='px-3 py-2 text-sm border border-white bg-green-800 text-white rounded-md hover:bg-white hover:border-green-800 hover:text-green-800 duration-300'
          >
            BuyMore
          </Link>
        ) : (
          <DropdownMenu>
            <DropdownMenuTrigger
              className='outline-none flex cursor-pointer'
              asChild
            >
              <div
                id='cart'
                className='flex gap-1 items-center hover:bg-gray-200 rounded-full p-2 duration-300'
              >
                <ShoppingBasket />
                <h2 className='bg-green-800 rounded-full w-7 h-7 md:w-7 md:h-7 text-center text-white items-center justify-center flex text-md md:text-lg'>
                  {loading ? (
                    <Loader className='animate-spin h-4 w-4' />
                  ) : (
                    CartInfo?.length
                  )}
                </h2>
              </div>
            </DropdownMenuTrigger>
            <DropdownMenuContent className='max-h-[calc(100vh-100px)] overflow-scroll'>
              <DropdownMenuLabel>All items</DropdownMenuLabel>
              <DropdownMenuSeparator />
              {CartInfo?.map((Cart: CartItem, index) => {
                console.log(Cart.attributes);
                const imageUrl =
                    Cart.attributes.product.data.attributes.Images.data[0]
                      .attributes.url || '';
                const { name, Price, mrp, QT } =
                  Cart.attributes.product.data.attributes;
                const { amount, quantity } = Cart.attributes;
                return (
                  <DropdownMenuItem
                    key={Cart.id}
                    className={
                      'gap-3 flex cursor-pointer items-center justify-between border-b border-gray-100 duration-300'
                    }
                  >
                    <Image
                      className='h-[50px] w-[50px] object-cover rounded-md'
                      src={imageUrl}
                      alt={name}
                      width={1000}
                      height={1000}
                      priority
                    />
                    <div className='flex flex-col w-full'>
                      <div className='flex w-full gap-2 justify-between'>
                        <h2 className='text-md'>{name}</h2>
                        <div className='flex gap-1'>
                          <h2 className='text-gray-700'>{QT}</h2>
                          <div className='flex gap-1 items-center'>
                            <h2 className='text-gray-600 text-md'>×</h2>
                            <h2 className='text-gray-600 text-md'>
                              {quantity}
                            </h2>
                          </div>
                        </div>
                      </div>
                      <div className='flex justify-end w-full'>
                        <h2 className=''>${amount.toFixed(2)}</h2>
                      </div>
                    </div>
                    <button
                      className='w-min p-2 text-gray-400 hover:scale-125 hover:text-gray-600 duration-300'
                      onClick={(e: React.MouseEvent<HTMLButtonElement>) =>
                        deleteFromCart(
                          e,
                          CartInfo,
                          setCartInfo,
                          setTotalPrice,
                          Cart.id,
                          jwt
                        )
                      }
                    >
                      <CircleX className='h-4 w-4' />
                    </button>
                  </DropdownMenuItem>
                );
              })}
              {CartInfo.length === 0 && (
                <DropdownMenuItem
                  className={
                    'gap-3 flex cursor-pointer items-center justify-between border-b border-gray-100 duration-300'
                  }
                >
                  Your shopping cart is currently empty.
                  <Link
                    href='/'
                    className='underline text-blue-500 cursor-pointer'
                  >
                    Shopping now
                  </Link>
                </DropdownMenuItem>
              )}
              <div className='flex justify-between p-2 pb-1 gap-2'>
                <h2>SubTotal:</h2>
                <h2>${totalPrice.toFixed(2)}</h2>
              </div>
              <Link href='/Checkout'>
                <button className='w-full my-1 p-1 border cursor-pointer rounded-md hover:bg-gray-100 hover:border-gray-300 duration-300'>
                  Check Out
                </button>
              </Link>
            </DropdownMenuContent>
          </DropdownMenu>
        )}

        {isLogin ? (
          <DropdownMenu>
            <DropdownMenuTrigger
              className='outline-none flex cursor-pointer'
              asChild
            >
              <CircleUserRound className='h-9 w-9 md:h-10 md:w-10 text-green-800 rounded-full'></CircleUserRound>
            </DropdownMenuTrigger>
            <DropdownMenuContent>
              <DropdownMenuLabel>All Category</DropdownMenuLabel>
              <DropdownMenuSeparator />
              {ProfileChoice?.map((category, index) => {
                let link = category.split(' ').join('');
                if (link === 'Home') {
                  link = '';
                }
                if (link === 'Logout') {
                  return (
                    <div
                      className='cursor-pointer items-center'
                      key={index + 'p'}
                      onClick={() => SignOut()}
                    >
                      <DropdownMenuItem className='px-2 flex '>
                        <h2 className='text-md'>{category}</h2>
                      </DropdownMenuItem>
                    </div>
                  );
                }
                return (
                  <Link href={'/' + link} key={index + 'p'}>
                    <DropdownMenuItem className='px-2 flex cursor-pointer items-center'>
                      <h2 className='text-md'>{category}</h2>
                    </DropdownMenuItem>
                  </Link>
                );
              })}
            </DropdownMenuContent>
          </DropdownMenu>
        ) : (
          <Link href='/login'>
            <Button
              variant='default'
              className='w-[60px] flex items-center justify-center bg-green-800 hover:bg-green-800 text-sm rounded-lg'
            >
              Login
            </Button>
          </Link>
        )}
      </div>
    </div>
  );
};
export default Header;
