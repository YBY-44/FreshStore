'use client';
import { useEffect, useState } from 'react';
import { useRouter, usePathname } from 'next/navigation';
import { toast } from 'react-toastify';
import GlobalAPI from '../../_utils/GlobalAPI';
import Link from 'next/link';
import { parseCookies } from 'nookies';
import { CheckCircle } from 'lucide-react';
import moment from 'moment';
const Page = () => {
  const router = useRouter();
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [orderId, setOrderId] = useState<string | null>(null);
  const { user, jwt } = parseCookies();

  useEffect(() => {
    // This code will only run on the client
    if (typeof window !== 'undefined') {
      const query = new URLSearchParams(window.location.search);
      setSessionId(query.get('session_id'));
      setOrderId(query.get('order_id'));
    }
  }, []);
  useEffect(() => {
    if (orderId && jwt) {
      // 调用后台 API 更新订单状态
      GlobalAPI.OrderStatusChange(Number(orderId), jwt, {
        status: 'Ordered',
        PaidTime: moment().format('DD/MMM/yyyy hh:mm'),
      })
        .then(() => {
          toast.success('Payment Success, Order is preparing.');
        })
        .catch((error) => {
          console.error('Error updating order status:', error);
        });
    }
  }, [orderId, jwt]);

  return (
    <div className='flex justify-center my-20'>
      <div className='border shadow-md flex flex-col justify-center px-32 p-20 rounded-md items-center'>
        <CheckCircle className='text-primary h-24 w-24' />
        <h2 className='font-medium text-3xl text-primary'>
          Payment Successful
        </h2>
        <h2 className='text-xl p-5'>
          Thank you so much for your order, We are preparing your order.
        </h2>
        <div className='mt-20 flex gap-3 items-end'>
        <h2 className='text-lg'>You can</h2>
          <Link href='/MyOrder' className='text-blue-800 underline text-2xl'>
            Click here{''}
          </Link>
          <h2 className='text-lg'>to track your order.</h2>
        </div>
      </div>
    </div>
  );
};

export default Page;
