'use client';
import React, { useEffect, useState } from 'react';
import { ProductType, CartItem } from '../../types';
import { getCartNumber } from '../../_componments/ProductSpecificCard';
import { parseCookies } from 'nookies';
import { toast } from 'react-toastify';
import { CartItemCard } from '@/_componments/CartItemCard';
import { Loader } from 'lucide-react';
import { CategoryBanner } from '@/_componments/CategoryBanner';
import { calculateTotalPrice, deleteFromCart } from '../../_componments/Header';
import { OrderInfo } from '@/_componments/OrderInfo';
import { PriceBox } from '@/_componments/PriceBox';
import { PayPalScriptProvider } from '@paypal/react-paypal-js';
export default function Page() {
  const [loading, setLoading] = useState(true);
  const [loading_edit, setLoadingEdit] = useState(false);
  const { user, jwt } = parseCookies();
  const [ProductList, setProductList] = useState<CartItem[]>([]);
  const [TotalPrice, setTotalPrice] = useState(0);
  useEffect(() => {
    getCartNumber(user, jwt)
      .then((res) => {
        calculateTotalPrice(res, setTotalPrice);
        setProductList(res);
        setLoading(false);
      })
      .catch((err) => {
        toast.error(err);
        setLoading(false);
      });
  }, []);
  return (
    <div>
      {' '}
        <CategoryBanner text={'CheckOut'} />
        <div className='p-5 w-full'>
          <div className='w-full border rounded-md px-2 py-5 sm:px-5 flex flex-col justify-center items-center'>
            <h2 className='w-full text-2xl p-2 border-b pb-5 text-center'>
              Your Cart list
            </h2>
            {loading && <Loader className='h-20 w-20 animate-spin p-5' />}
            {loading_edit && (
              <h2 className='p-10 text-xl animate-pulse w-full text-center'>
                deleting...
              </h2>
            )}
            {ProductList?.map((Cart: CartItem, index) => {
              return (
                <CartItemCard
                  item={Cart}
                  key={Cart.id}
                  items={ProductList}
                  setPrice={setTotalPrice}
                  setItems={setProductList}
                  index={index}
                  setLoading={setLoadingEdit}
                />
              );
            })}
            <div className='border-t w-full p-2'></div>
            <div className='w-full'>
              <OrderInfo
                loading={loading || loading_edit}
                price={TotalPrice}
                num={Number(ProductList.length)}
                products={ProductList}
              />
            </div>
          </div>
        </div>
    </div>
  );
}
