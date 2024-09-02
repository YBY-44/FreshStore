'use client';
import { useEffect, useState } from 'react';
import { toast } from '../../_utils/Toast';
import GlobalAPI from '../../_utils/GlobalAPI';
import { parseCookies } from 'nookies';
import { OrderCard } from '../../_componments/OrderCard';
import { OrderTypeWithId } from '../../types';
import { CategoryBanner } from '../../_componments/CategoryBanner';
import { Loader } from 'lucide-react';
import Link from 'next/link';
export default function Page() {
  const [loading, setLoading] = useState(true);
  const { user, jwt } = parseCookies();
  const [orders, setOrders] = useState<OrderTypeWithId[]>([]);
  const getMyOrder = async () => {
    if (jwt) {
      setLoading(true);
      await GlobalAPI.GetMyOrders(JSON.parse(user).id, jwt)
        .then((res) => {
          console.log(res);
          console.log(res.data);
          setOrders(res.data);
        })
        .catch((error) => {
          toast.error('Error fetching orders');
        });
        setLoading(false);
    } else{
        toast.error('Please login to view your orders');
    }
  };
  useEffect(() => {
    getMyOrder();
  }, []);
  return (
    <div className=''>
      <CategoryBanner text={'My Order'} />
      <h2 className='py-8 text-3xl font-bold text-primary mx-7 md:mx-20'>Order History</h2>
      <div className='mb-8 mx-7 md:mx-20 gap-5 flex flex-col'>
        {orders.slice().reverse().map((order) => {
          return <OrderCard orderInfo={order} key={order.id} />;
        })}
        {loading && <div className='flex justify-center w-full'><Loader className="animate-spin h-20 w-20"/></div>}
        {!loading && orders.length === 0 && <div className='flex text-xl w-full justify-center gap-1'>No,orders found, <Link href="/" className='text-xl text-center text-blue-500 underline'>Start Shopping Now.</Link></div>}
      </div>
    </div>
  );
}
