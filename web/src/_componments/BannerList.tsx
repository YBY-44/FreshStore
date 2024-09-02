'use client';
import React, { useEffect, useState } from 'react';
import Image from 'next/image';
import { LayoutGrid, Search } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { ShoppingBasket } from 'lucide-react';
import GlobalAPI from '../_utils/GlobalAPI';
import { BannerType } from '../types';
import {
  Carousel,
  CarouselContent,
  CarouselItem,
  CarouselNext,
  CarouselPrevious,
} from '@/components/ui/carousel';

export const Banner = () => {
  const [BannerList, setBannerList] = useState<BannerType[]>([]);
  const GetBannerAndSliderList = () => {
    GlobalAPI.getSliders()
      .then((resp) => {
        const res=resp.data.data;
        const bannerList = res.filter(
          ( banner : BannerType ) => {
            return banner.attributes.Type === 'Banner';
          }
        );
        setBannerList(bannerList);
        return resp.data.data;
      })
      .catch((err) => {
        setBannerList([]);
        return [];
      });
  };
  useEffect(() => {
    GetBannerAndSliderList();
  }, []);
  return (
    <div className='px-2 md:px-5'>
      <h2
        className='bg-green-600 p-3 m-3 mt-2
      rounded-md text-green-100'
      >
        We Offer 24/7 security delivery to all location, Order Any time, we asure you the best service.
      </h2>
      <Carousel>
        <CarouselContent>
          {BannerList?.map((Banner) => {
            const imageUrl =
              process.env.NEXT_PUBLIC_ICON_URL +
                Banner.attributes.Image?.data?.attributes?.url || '';
            return (
              <CarouselItem key={Banner.id}>
                <Image
                  className='object-cover h-[250px] md:h-[400px] w-full rounded-xl shadow-lg'
                  key={Banner.id}
                  src={imageUrl}
                  alt={Banner.attributes.Sname || ''}
                  width={1920}
                  height={1080}
                  priority
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
export default Banner;
