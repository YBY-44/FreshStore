'use client';
import { ProductType } from '../types';
import { use, useState, useEffect } from 'react';
import Image from 'next/image';
import { Button } from '@/components/ui/button';
import { ShoppingBasket } from 'lucide-react';
import { zodResolver } from '@hookform/resolvers/zod';
import { useForm } from 'react-hook-form';
import {
  FormTypePickNumber,
  PickNumber,
  schemaNumber,
} from '@/_forms/PurchaseNumber';
export const ProductSpecificCard = ({ product }: { product: ProductType }) => {
  const [Tp, setTp] = useState<number>(0);
  const {
    register,
    handleSubmit,
    setValue,
    getValues,
    watch,
    formState: { errors },
  } = useForm({
    resolver: zodResolver(schemaNumber),
    defaultValues: { amount: 1 }
  });
  const amount = watch('amount');
  const increment = () => {
    const number = getValues('amount');
    if (number && number < 99) {
      setValue('amount', Number(number) + 1);
    }
  };
  const decrement = () => {
    const number = getValues('amount');
    if (number && number > 1) {
      setValue('amount', number - 1);
    }
  };
  const claculatePrice = (amount: number, price: number) => {
    setTp(amount * price);
  };
  useEffect(() => {
    claculatePrice(amount, product.attributes.Price || product.attributes.mrp);
  }, [amount, product.attributes.Price, product.attributes.mrp]);
  const imageUrl =
    process.env.NEXT_PUBLIC_ICON_URL +
      product.attributes.Images?.data[0]?.attributes?.url || '';
  return (
    <div className='grid grid-cols-1 md:grid-cols-2 text-black overflow-y-scroll gap-5'>
      <Image
        className='w-full h-[300px] cursor-pointer object-cover rounded-md'
        src={imageUrl || ''}
        alt={product?.attributes.name || ''}
        width={300}
        height={300}
        style={{ height: 'auto' }}
        priority
      />
      <div className='flex flex-col gap-3 items-center'>
        <h2 className='font-bold text-2xl'>{product.attributes.name}</h2>
        <h2 className='text-sm text-gray-700 text-center'>
          {product.attributes.describtion}
        </h2>
        <div className='flex items-end'>
          <h2
            className={
              'font-bold text-3xl pr-3' +
              (product.attributes.Price ? ' text-gray-700 line-through' : '')
            }
          >
            {' $' + product.attributes.mrp + ' '}
          </h2>
          {product.attributes.Price && (
            <h2 className='font-bold text-3xl'>
              ${product.attributes.Price.toFixed(2)}
            </h2>
          )}
        </div>
        <h2 className='text-lg font-medium'>
          Quantity{' (' + product.attributes.QT + ')'}
        </h2>
        <div className='flex flex-col items-center pt-2 pb-5 gap-5'>
          <div className='items-center flex justify-between rounded-full bg-gray-100'>
            <button
              onClick={() => decrement()}
              className='rounded-l-full bg-gray-300 text-xl w-8 h-8 flex items-center justify-center text-gray-800'
            >
              -
            </button>
            <input
              className='text-xl text-center w-[50px] h-8 mx-2 justify-center flex outline-none bg-gray-100'
              maxLength={2}
              {...register('amount')}
            />
            {errors && <p>{errors.root?.message}</p>}
            <button
              onClick={() => increment()}
              className='rounded-r-full bg-gray-300 text-xl w-8 h-8 flex items-center justify-center text-gray-800'
            >
              +
            </button>
          </div>
          <Button
            variant={'outline'}
            className='text-green-600 border-green-600 hover:border-gray-800'
          >
            <ShoppingBasket />
            Add to Cart {` ${Tp ? ' ($' + Tp.toFixed(2) + ')' : ''}`}
          </Button>
        </div>
      </div>
    </div>
  );
};
