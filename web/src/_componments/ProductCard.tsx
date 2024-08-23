import React from 'react';
import Image from 'next/image';
import { ProductType } from '../types';
import { ProductOne } from '@/_componments/ProductOne';
export const ProductCard = ({
  product,
  imageUrl,
  ...props
}: {
  product: ProductType;
  imageUrl: string;
}) => {
  return (
    <div className='flex flex-col p-5 md:p-5 
    gap-5 rounded-md shadow-md 
    items-center font-bold hover:scale-105
    hover:shadow-2xl transition-all ease-in-out duration-300
    '>
      <Image
        src={imageUrl}
        className='mb-1 rounded-md h-64 object-cover shadow-sm cursor-pointer gap-3'
        alt={product.attributes.name || ''}
        width={500}
        height={200}
        style={{ height: 'auto' }}
        priority
      />
      <h2 className='text-lg p-0 m-0'>{product.attributes.name}</h2>
      <div className='flex items-end'>
        <h2
          className={'text-xl p-0 px-2 ' + (product.attributes.Price ? 'line-through text-gray-500' : '')}
        >
          ${product.attributes.mrp}
        </h2>
        <h2 className='text-xl p-0 m-0'>${product.attributes.Price}</h2>
        <h2 className='mx-1'>/</h2>
        <h2 className='text-sm p-0 m-0'>{product.attributes.QT}</h2>
      </div>
      <ProductOne product={product}/>


    </div>
  );
};
