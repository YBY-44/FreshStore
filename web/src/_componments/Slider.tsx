'use client';
import React, { useEffect, useState } from 'react';
import Image from 'next/image';
import { LayoutGrid, Search } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { ShoppingBasket } from 'lucide-react';
import GlobalAPI from '../_utils/GlobalAPI';
import {Loader} from 'lucide-react';
import { SliderType } from '../types';
import {
  Carousel,
  CarouselContent,
  CarouselItem,
  CarouselNext,
  CarouselPrevious,
} from '@/components/ui/carousel';

export const Slider = ({
  SliderList,
  loading,
}: {
  SliderList: SliderType[];
  loading: boolean;
}) => {
  return (
    <div className='px-2 py-2 md:px-5 md:py-5'>
      {loading && (<div className='flex h-[250px] md:h-[400px] justify-center items-center'><Loader className='h-10 w-10 animate-spin'/></div>)}
      <Carousel>
        <CarouselContent>
          {SliderList?.map((slider) => {
            const imageUrl =
              process.env.NEXT_PUBLIC_ICON_URL +
                slider.attributes.Image?.data?.attributes?.url || '';
            return (
              <CarouselItem key={slider.id}>
                <Image
                  className='object-cover h-[250px] md:h-[400px] w-full rounded-xl shadow-lg'
                  key={slider.id}
                  src={imageUrl}
                  alt={slider.attributes.Sname || ''}
                  width={1920}
                  height={1080}
                  priority
                  style={{ height: 'auto' }}
                />
              </CarouselItem>
            );
          })}
        </CarouselContent>
        <CarouselPrevious />
        <CarouselNext />
      </Carousel>
    </div>
  );
};
export default Slider;
