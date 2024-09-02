'use client';
import { useEffect, useState } from 'react';
import { useRouter, usePathname } from 'next/navigation';
import { toast } from 'react-toastify';
import GlobalAPI from '../../_utils/GlobalAPI';
import Link from 'next/link';
import { parseCookies } from 'nookies';
import { BadgeAlert } from 'lucide-react';
const Page = () => {
  return (
    <div className='flex justify-center my-20'>
      <div className='border shadow-md flex flex-col justify-center px-32 p-20 rounded-md items-center'>
        <BadgeAlert className='text-red-600 h-24 w-24' />
        <h2 className='font-medium text-4xl text-red-600'>
          Payment Unsuccessful
        </h2>
        <div className='p-10 text-center gap-5'>
          <h2 className='text-2xl'>Thank you for your order!</h2>
          <h2 className='text-xl'>
            Unfortunately, your payment was unsuccessful. Please complete the
            payment to proceed with your order preparation.
          </h2>
        </div>

        <div className='mt-10 flex gap-3 items-end'>
          <h2 className='text-lg'>You can</h2>
          <Link href='/MyOrder' className='text-blue-800 underline text-2xl'>
            Click here{''}
          </Link>
          <h2 className='text-lg'>to find your order and finish your payment.</h2>
        </div>
      </div>
    </div>
  );
};

export default Page;
