'use client';
import React, { use, useState, useEffect, useRef } from 'react';
import { PayPalButtons, PayPalScriptProvider } from '@paypal/react-paypal-js';
export const PriceBox = ({
  ordering,
  price,
  num,
  loading,
  delivery,
}: {
  ordering: boolean;
  price: number;
  num: number;
  loading: boolean;
  delivery: number;
}) => {
  const [FinalPrice, setFinalPrice] = useState('0.1');
  const FinalPriceRef = useRef(FinalPrice);
  useEffect(() => {
    const calculatedFinalPrice = (
      price +
      delivery +
      (price + delivery) / 10
    ).toFixed(2);
    console.log('Calculated Final Price:', calculatedFinalPrice);
    FinalPriceRef.current = calculatedFinalPrice;
    setFinalPrice(calculatedFinalPrice);
  }, [price, delivery]);

  return (
    <PayPalScriptProvider
      options={{
        clientId: process.env.NEXT_PUBLIC_PALPAY_CLIENT_ID || '',
        secret: process.env.NEXT_PUBLIC_PALPAY_KAY || '',
      }}
    >
      <div className='flex flex-col p-2'>
        <div className='text-xl flex flex-col w-ful border'>
          <h1 className='text-xl font-bold text-center bg-gray-200 p-5'>
            Total Cart ({num.toFixed(0)})
          </h1>
          <div className='flex justify-between font-bold text-xl p-5 border-b'>
            <h2>SubTotal:</h2>
            <h2>${price.toFixed(2)}</h2>
          </div>
          <div className='flex justify-between py-3 px-5'>
            <h2>Delivery:</h2>
            <h2 className='text-xl'>${delivery.toFixed(2)}</h2>
          </div>
          <div className='flex justify-between py-3 px-5 border-b'>
            <h2>GST(TAX):</h2>
            <h2 className='text-xl'>
              ${(price / 10 + delivery / 10).toFixed(2)}
            </h2>
          </div>
          <div className='flex justify-between font-bold text-xl p-5'>
            <h2>Total:</h2>
            <h2>
              ${(price + price / 10 + delivery + delivery / 10).toFixed(2)}
            </h2>
          </div>
          <div className='p-5 w-full'>
            <button
              type='submit'
              disabled={loading || ordering}
              className='mb-5 p-2 border rounded-md w-full hover:bg-gray-100 duration-300'
            >
              {ordering ? (
                <h2 className='animate-pulse'>Processing...</h2>
              ) : (
                'Pay Now'
              )}
            </button>
            {/* <PayPalButtons
              style={{ layout: 'horizontal' }}
              createOrder={(data: any, actions: any) => {
                console.log(
                  'FinalPrice in createOrder:',
                  FinalPriceRef.current
                );
                console.log('Price:', price);
                console.log('Delivery:', delivery);

                return actions.order.create({
                  purchase_units: [
                    {
                      amount: {
                        value: FinalPriceRef.current,
                        currency_code: 'USD',
                      },
                    },
                  ],
                });
              }}
              onApprove={(data: any, actions: any) => {
                return actions.order.capture().then((details: any) => {
                  console.log(
                    'Transaction completed by ' + details.payer.name.given_name
                  );
                });
              }}
            /> */}
          </div>
        </div>
      </div>
    </PayPalScriptProvider>
  );
};
