'use client';
import { OrderTypeWithId } from '../types';
import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from '@/components/ui/collapsible';
import { Loader } from 'lucide-react';
import moment from 'moment';
import { useEffect, useState } from 'react';
import { slotDict } from '@/_utils/constants';
import Image from 'next/image';
import { OrderInfo } from './OrderInfo';
import { Button } from '@/components/ui/button';
import { toast } from '../_utils/Toast';
import GlobalAPI from '../_utils/GlobalAPI';
import { parseCookies } from 'nookies';
import { set } from 'lodash';
import { on } from 'events';
export const OrderCard = ({
  orderInfo,
  ...props
}: {
  orderInfo: OrderTypeWithId;
}) => {
  const [status, setStatus] = useState(orderInfo.status);
  const [onAction, setOnAction] = useState(false);
  const { user, jwt } = parseCookies();
  const [slot, setSlot] = useState('');
  const [cancelTime, setCancelTime] = useState(orderInfo.CancelTime);
  const [pickedTime, setPickedTime] = useState(orderInfo.PickedTime);
  const [paidTime, setPaidTime] = useState(orderInfo.PaidTime);
  const [DeliverTime, setDeliverTime] = useState(orderInfo.DeliverTime);
  useEffect(() => {
    setSlot(slotDict[orderInfo.Duration]);
  }, [orderInfo]);

  const PickedOrder = async () => {
    setOnAction(true);
    await GlobalAPI.OrderStatusChange(Number(orderInfo.id), jwt, {
      status: 'Finished',
      PickedTime: moment().format('DD/MMM/yyyy hh:mm'),
    })
      .then(() => {
        setOnAction(false);
        setPickedTime(moment().format('DD/MMM/yyyy hh:mm'));
        setStatus('Finished');
        toast.success('Thank you, Enjoy your meal!');
      })
      .catch((error) => {
        setOnAction(false);
        console.error('Sorry, we meet some issue try again later', error);
      });
  };
  const CancelOrder = async () => {
    setOnAction(true);
    await GlobalAPI.OrderStatusChange(Number(orderInfo.id), jwt, {
      status: 'Cancelled',
      CancelTime: moment().format('DD/MMM/yyyy hh:mm'),
    })
      .then(() => {
        setOnAction(false);
        setCancelTime(moment().format('DD/MMM/yyyy hh:mm'));
        setStatus('Cancelled');
        toast.success(
          'Order has been cancelled, we will refund you IN 3-5 business days'
        );
      })
      .catch((error) => {
        setOnAction(false);
        console.error('Sorry, we meet some issue try again later', error);
      });
  };
  const PayOrder = async () => {};
  const ChangeDetails = async () => {
    toast.error('Sorry, this function is not available now');
  };
  const ReportOrder = async () => {
    toast.error('Sorry, this function is not available now');
  };
  return (
    <Collapsible className='w-full'>
      <CollapsibleTrigger className='w-full'>
        <div className='border rounded-md'>
          <div className='flex bg-gray-100 items-center justify-between p-5'>
            <h2 className='text-md sm:text-xl text-start rounded-md'>
              Oid: {orderInfo.id}
            </h2>
            <div className='flex flex-col text-center'>
              <h2 className='text-md sm:text-xl'>Order Date</h2>
              <h2 className='text-sm sm:text-md text-gray-700'>
                {moment(orderInfo?.createdAt).format('DD/MMM/yyyy hh:mm')}
              </h2>
            </div>
            <div className='flex flex-col items-center'>
              <h2 className='text-md sm:text-xl'>Status</h2>
              <div
                className={
                  'text-md sm:text-xl ' +
                  (status === 'Unpaid' && ' text-red-700 ') +
                  (status === 'Ordered' && ' text-green-700 ') +
                  (status === 'Delivering' && ' text-green-700 ') +
                  (status === 'Delivered' && ' text-green-700 ') +
                  (status === 'Finished' && ' text-black ') +
                  (status === 'Cancelled' && ' text-gray-500 ')
                }
              >
                {status}
              </div>
            </div>
            <div>
              <h2 className='text-md sm:text-xl'>Total</h2>
              <h2 className='text-md sm:text-xl text-gray-700'>
                ${orderInfo?.TotalPrice.toFixed(2)}
              </h2>
            </div>
          </div>

          <div className='flex flex-col lg:flex-row lg:items-between justify-between items-center gap-5 px-8 py-5 w-full hover:bg-gray-50 duration-300'>
            <div className='flex flex-col sm:flex-row justify-around gap-5 w-full'>
              <div className='flex flex-col'>
                <h2 className='text-md sm:text-xl'>Customer Information</h2>
                <h2 className='text-sm sm:text-md text-gray-700'>
                  {orderInfo.CostumerName}
                </h2>
                <h2 className='text-sm sm:text-md text-gray-700'>
                  {orderInfo.CostumerEmail}
                </h2>
              </div>
              <div className='flex flex-col'>
                <h2 className='text-md sm:text-xl'>Delivery Date</h2>
                <h2 className='text-sm sm:text-md text-gray-700'>
                  {orderInfo.ExpectDay}
                </h2>
                <h2 className='text-sm sm:text-md text-gray-700'>{slot}</h2>
              </div>
            </div>
          </div>
        </div>
      </CollapsibleTrigger>
      <CollapsibleContent className='border bg-white py-5 flex flex-col lg:flex-row gap-5'>
        <div className='lg:w-[50%] lg:border-r border-b pb-2'>
          <h2 className='mx-7 pb-2 text-center font-bold text-xl border-b'>
            Order Items
          </h2>
          <div className='pt-3'></div>
          {orderInfo.OrderItemList.map((item) => {
            console.log(item.product.Images[0].url);
            const image =
              process.env.NEXT_PUBLIC_ICON_URL + item.product.Images[0].url ||
              '';
            return (
              <div
                key={item.id}
                className='px-4 pb-4 flex justify-center w-full'
              >
                <div className='flex justify-between w-full border-b px-3'>
                  <Image
                    className='w-[70px] h-[70px] mb-3 mr-3 object-cover rounded-md'
                    src={image}
                    alt={item.product.name}
                    width={500}
                    height={500}
                  />
                  <div className='flex flex-col w-full'>
                    <h2 className='text-md w-full'>{item.product.name}</h2>
                    <div className='flex gap-2 w-full'>
                      <h2 className='text-md'>{item.product.QT}</h2>
                      <h2 className='text-md'>×</h2>
                      <h2 className='text-md'>{item.quantity}</h2>
                    </div>
                    <h2 className='text-md'>${item.TotalPrice.toFixed(2)}</h2>
                  </div>
                </div>
              </div>
            );
          })}
          <div className='px-7'>
            <div className='pb-2 mb-2 px-4 border-b text-sm sm:text-md md:text-lg'>
              <div className='flex justify-between'>
                <h2 className=''>Delivery Fee: </h2>
                <h2 className='text-gray-700 '>
                  ${orderInfo?.DeliveryPrice.toFixed(2)}
                </h2>
              </div>
              <div className='flex justify-between'>
                <h2>SubTotal: </h2>
                <h2 className='text-gray-700'>
                  ${orderInfo?.Subtotal.toFixed(2)}
                </h2>
              </div>
              <div className='flex justify-between'>
                <h2>GST: </h2>
                <h2 className='text-gray-700'>${orderInfo?.GST.toFixed(2)}</h2>
              </div>
            </div>
          </div>

          <div className='flex justify-between text-md sm:text-lg md:text-xl px-10 '>
            <h2>Total:</h2>
            <h2 className='text-gray-700'>
              ${orderInfo?.TotalPrice.toFixed(2)}
            </h2>
          </div>
        </div>

        <div className='px-7 mb-3 gap-6 flex flex-col'>
          <h2 className='pb-2 text-center font-bold text-xl border-b'>
            Order Summary
          </h2>
          <div className='flex flex-col text-sm'>
            <h2 className='text-lg sm:text-xl'>Customer Information</h2>
            <div className='flex justify-between sm:text-md md:text-lg text-sm'>
              <h2>Name:</h2>
              <h2 className='text-gray-700'>{orderInfo.CostumerName}</h2>
            </div>

            <div className='flex justify-between sm:text-md md:text-lg text-sm'>
              <h2>Email:</h2>
              <h2 className='text-gray-700'>{orderInfo.CostumerEmail}</h2>
            </div>

            <div className='flex justify-between sm:text-md md:text-lg text-sm'>
              <h2>Phone:</h2>
              <h2 className='text-gray-700'>{orderInfo.Phone}</h2>
            </div>
          </div>
          <div className='flex flex-col sm:flex-row sm:justify-between sm:items-center gap-2'>
            <h2 className='text-lg sm:text-xl'>Delivery Address</h2>
            <h2 className='text-md text-gray-700'>{orderInfo.OrderAddress}</h2>
          </div>
          <div className='flex flex-col gap-2'>
            <div className='flex flex-col sm:flex-row sm:justify-between sm:items-center'>
              <h2 className='text-md sm:text-lg'>Delivery Day</h2>
              <h2 className='text-md text-gray-500'>{orderInfo.ExpectDay}</h2>
            </div>
            <div className='flex flex-col sm:flex-row sm:justify-between sm:items-center'>
              <h2 className='text-md sm:text-lg'>Time</h2>
              <h2 className='text-md text-gray-500'>{slot}</h2>
            </div>
            <div className='flex flex-col sm:flex-row sm:justify-between sm:items-center'>
              <h2 className='text-md sm:text-lg'>Current Status</h2>
              <h2 className='text-md text-gray-500'>{status}</h2>
            </div>
            <div className='flex flex-col sm:flex-row sm:justify-between sm:items-center'>
              <h2 className='text-md sm:text-lg'>Order Time</h2>
              <h2 className='text-md text-gray-500'>
                {moment(orderInfo?.createdAt).format('DD/MMM/yyyy hh:mm')}
              </h2>
            </div>
            {paidTime && (
              <div className='flex flex-col sm:flex-row sm:justify-between sm:items-center'>
                <h2 className='text-md sm:text-lg'>Paid Time</h2>
                <h2 className='text-md text-gray-500'>{paidTime}</h2>
              </div>
            )}
            {cancelTime && (
              <div className='flex flex-col sm:flex-row sm:justify-between sm:items-center'>
                <h2 className='text-md sm:text-lg'>Cancel Time</h2>
                <h2 className='text-md text-gray-500'>{cancelTime}</h2>
              </div>
            )}
            {DeliverTime && (
              <div className='flex flex-col sm:flex-row sm:justify-between sm:items-center'>
                <h2 className='text-md sm:text-lg'>Deliver Time</h2>
                <h2 className='text-md text-gray-500'>{DeliverTime}</h2>
              </div>
            )}
            {pickedTime && (
              <div className='flex flex-col sm:flex-row sm:justify-between sm:items-center'>
                <h2 className='text-md sm:text-lg'>Picked Time</h2>
                <h2 className='text-md text-gray-500'>{pickedTime}</h2>
              </div>
            )}
          </div>

          <div className='w-full gap-5 flex flex-col border-t pt-3'>
            <div className='w-full'>
              {status === 'Unpaid' &&
                (
                  <Button
                    className='bg-green-600 hover:bg-green-700'
                    onClick={PayOrder}
                  >
                    {onAction ? (
                    <Loader className='h-5 w-5 animate-spin' />
                  ) : (
                    'Pay Now'
                  )}
                  </Button>
                )}
              {status === 'Delivered' && (
                <Button
                  className='bg-green-600 hover:bg-green-700 w-full'
                  onClick={PickedOrder}
                >
                  {onAction ? (
                    <Loader className='h-5 w-5 animate-spin' />
                  ) : (
                    'Picked Order'
                  )}
                </Button>
              )}
            </div>
            <div className='flex sm:flex-row flex-col gap-2 w-full sm:items-center'>
              <h2 className='w-full'>Any help?</h2>
              {(status === 'Ordered' || status === 'Unpaid') && (
                <Button
                  className='bg-red-600 hover:bg-red-700'
                  onClick={CancelOrder}
                >
                  {onAction ? (
                    <Loader className='h-5 w-5 animate-spin' />
                  ) : (
                    'Cancel Order'
                  )}
                </Button>
              )}
              {(status === 'Ordered' || status === 'Unpaid') && (
                <Button
                  className='bg-blue-600 hover:bg-blue-700'
                  onClick={ReportOrder}
                >
                  {onAction ? (
                    <Loader className='h-5 w-5 animate-spin' />
                  ) : (
                    'Change Details'
                  )}
                </Button>
              )}
              {(status === 'Delivered' || status === 'Finished') && (
                <Button
                  className='bg-gray-600 hover:bg-gray-700'
                  onClick={ReportOrder}
                >
                  {onAction ? (
                    <Loader className='h-5 w-5 animate-spin' />
                  ) : (
                    'Report Order'
                  )}
                </Button>
              )}
            </div>
          </div>
        </div>
      </CollapsibleContent>
    </Collapsible>
  );
};
