'use client';
import InputComponment from '../_componments/Input';
import {
  FormTypePickDetail,
  PickDetail,
  schemaDetail,
} from '../_forms/DetailForm';
import { PriceBox } from './PriceBox';
import { Controller } from 'react-hook-form';
import { LocationInfo, useSearchLocation } from '../lib/debonce';
import MuiAutocomplete, { AutocompleteProps } from '@mui/material/Autocomplete';
import TextField from '@mui/material/TextField';
import { slotType } from '../_utils/constants';
import { Input } from '@/components/ui/input';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select';
import { CartItem } from '../types';
import { PayPalScriptProvider, PayPalButtons } from '@paypal/react-paypal-js';

import { loadStripe } from '@stripe/stripe-js';
import { OrderTypeWithId } from '../types';
import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from '@/components/ui/collapsible';
import { HelpOrder } from './orderHelp';
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
import { createBookingSession } from '../_componments/OrderInfo';
import { string } from 'zod';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
export const OrderCard = ({
  orderInfo,
  ...props
}: {
  orderInfo: OrderTypeWithId;
}) => {
  const {
    register,
    control,
    handleSubmit,
    setValue,
    getValues,
    watch,
    formState: { errors },
  } = useForm<FormTypePickDetail>({
    resolver: zodResolver(schemaDetail),
    defaultValues: {
      name: orderInfo.CostumerName || '',
      email: orderInfo.CostumerEmail || '',
      time: orderInfo.ExpectDay || '',
      phone: orderInfo.Phone || '',
      slot: orderInfo.Duration,
      postCode: orderInfo.Postcode || '',
      address: orderInfo.OrderAddress || 'Not Set',
    },
  });
  const { name, email, time, address, phone, slot: newslot } = watch();

  const [status, setStatus] = useState(orderInfo.status);
  const [onPay, setOnPay] = useState(false);
  const { user, jwt } = parseCookies();
  const [isEdit, setIsEdit] = useState(false);
  const [onCancel, setOnCancel] = useState(false);
  const [onPick, setOnPick] = useState(false);
  const [onChange, setOnChange] = useState(false);
  const [slot, setSlot] = useState('');
  const [changing, setChanging] = useState(false);
  const [cancelTime, setCancelTime] = useState(orderInfo.CancelTime);
  const [pickedTime, setPickedTime] = useState(orderInfo.PickedTime);
  const [paidTime, setPaidTime] = useState(orderInfo.PaidTime);
  const [DeliverTime, setDeliverTime] = useState(orderInfo.DeliverTime);
  const [CurrentAddress, setAddress] = useState(orderInfo.OrderAddress);
  const [NowAddress, setNowAddress] = useState(orderInfo.OrderAddress);

  useEffect(() => {
    if (orderInfo.OrderAddress) {
      setAddress(orderInfo.OrderAddress);
    }
  }, [orderInfo]);

  const { loading, setLoading, LocationInfo, searchText, setsearchText } =
    useSearchLocation(NowAddress);

  useEffect(() => {
    setSlot(slotDict[orderInfo.Duration]);
  }, [orderInfo]);

  const PickedOrder = async () => {
    setOnPick(true);
    await GlobalAPI.OrderStatusChange(Number(orderInfo.id), jwt, {
      status: 'Finished',
      PickedTime: moment().format('DD/MMM/yyyy hh:mm'),
    })
      .then(() => {
        setOnPick(false);
        setPickedTime(moment().format('DD/MMM/yyyy hh:mm'));
        setStatus('Finished');
        toast.success('Thank you, Enjoy your meal!');
      })
      .catch((error) => {
        setOnPick(false);
        console.error('Sorry, we meet some issue try again later', error);
      });
  };

  const CancelOrder = async () => {
    setOnCancel(true);
    await GlobalAPI.OrderStatusChange(Number(orderInfo.id), jwt, {
      status: 'Cancelled',
      CancelTime: moment().format('DD/MMM/yyyy hh:mm'),
    })
      .then(() => {
        setOnCancel(false);
        setCancelTime(moment().format('DD/MMM/yyyy hh:mm'));
        setStatus('Cancelled');
        toast.success(
          'Order has been cancelled, we will refund you IN 3-5 business days'
        );
      })
      .catch((error) => {
        setOnCancel(false);
        console.error('Sorry, we meet some issue try again later', error);
      });
  };

  const PayOrder = async () => {
    setOnPay(true);
    if (!orderInfo.TotalPrice || !orderInfo.id) {
      toast.error('Sorry, we meet some issue try again later');
      setOnPay(false);
      return;
    }
    await createBookingSession(
      {
        totalPrice: orderInfo.TotalPrice,
        orderId: orderInfo.id,
      },
      jwt
    )
      .then((data) => {
        console.log('data: ', data);
        setOnPay(false);
      })
      .catch((error) => {
        toast.error('Sorry, we meet some issue try again later', error);
        setOnPay(false);
      });
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
            const image = item.product.Images[0].url || '';
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

        <div className='px-7 mb-3 gap-6 flex flex-col w-full'>
          <h2 className='pb-2 text-center font-bold text-xl border-b'>
            Order Summary
          </h2>
          <form
            onSubmit={handleSubmit(() => {
              setChanging(true);
              console.log('submit');
              if (!isEdit) {
                toast.error('Sorry, this function is not available now');
                setChanging(false);
                return;
              }
              if (!orderInfo.id || !jwt) {
                toast.error('Sorry, Please login again');
                setChanging(false);
                return;
              }
              console.log({
                CostumerName: name,
                CostumerEmail: email,
                OrderAddress: CurrentAddress,
                Phone: phone,
                ExpectDay: time,
                Duration: newslot,
              });
              GlobalAPI.OrderDetailChange(Number(orderInfo.id), jwt, {
                CostumerName: name,
                CostumerEmail: email,
                OrderAddress: CurrentAddress,
                Phone: phone,
                ExpectDay: time,
                Duration: newslot,
              })
                .then((resp) => {
                  if (resp.data) {
                    console.log('resp: ', resp.data);
                    console.log(resp.data.data.OrderAddress);
                    setValue('address', resp.data.data.OrderAddress);
                    setNowAddress(resp.data.data.OrderAddress);
                    toast.success('Order Details Changed');
                    setChanging(false);
                    setIsEdit(false);
                  }
                })
                .catch((error) => {
                  toast.error('Sorry, we meet some issue try again later');
                  setChanging(false);
                  console.error(error);
                });
            })}
            className={
              'p-5 rounded-md w-full flex flex-col gap-8 justify-between' +
              (isEdit ? ' border' : '')
            }
          >
            <div className='flex flex-col text-sm gap-4'>
              <h2 className='text-lg sm:text-xl'>Customer Information</h2>
              <div className='flex justify-between sm:text-md md:text-lg text-sm items-center gap-5'>
                <h2>Name:</h2>
                <Input
                  className='text-gray-700 w-[calc(100%-80px)] text-sm'
                  {...register('name')}
                  disabled={!isEdit}
                />
              </div>

              <div className='flex justify-between sm:text-md md:text-lg text-sm items-center gap-5'>
                <h2>Email:</h2>
                <Input
                  className='text-gray-700 w-[calc(100%-80px)] text-sm'
                  {...register('email')}
                  disabled={!isEdit}
                />
              </div>

              <div className='flex justify-between sm:text-md md:text-lg text-sm items-center gap-5'>
                <h2>Phone:</h2>
                <Input
                  className='text-gray-700 w-[calc(100%-80px)] text-sm'
                  {...register('phone')}
                  disabled={!isEdit}
                />
              </div>
            </div>
            <div className='flex flex-col items-center gap-1 w-full'>
              <h2 className='text-lg sm:text-xl w-full'>Delivery Address</h2>
              <h2 className='text-sm text-gray-600 w-full'>{NowAddress}</h2>
              {isEdit && (
                <MuiAutocomplete<LocationInfo>
                  autoSelect
                  handleHomeEndKeys
                  defaultValue={{ placeName: NowAddress }}
                  classes={{
                    root: 'font-light rounded-md w-full',
                    input: 'p-2',
                    noOptions: 'p-2',
                    loading: 'border shadow-none',
                    listbox: 'bg-white p-2',
                    option: 'h-12 text-sm p-2',
                    paper: 'rounded-md border',
                  }}
                  options={LocationInfo?.length ? LocationInfo : []}
                  isOptionEqualToValue={(option, value) => {
                    return option.placeName === value.placeName;
                  }}
                  noOptionsText={
                    searchText ? 'No Options' : 'Try type something to search'
                  }
                  getOptionLabel={(option) => {
                    return option.placeName;
                  }}
                  onInputChange={(_, v: string) => {
                    // 更正 v 类型
                    console.log('v: ', v);
                    setLoading(true);
                    setAddress(v);
                    setsearchText(v);
                  }}
                  loading={loading}
                  renderInput={(params) => {
                    console.log(CurrentAddress);
                    return (
                      <div className='flex flex-col w-full'>
                        <label className='text-md font-normal w-full'>
                          New Address
                        </label>
                        <TextField
                          classes={{
                            root: 'rounded-lg',
                          }}
                          {...params}
                          id='autocomplete-input'
                          InputProps={{
                            ...params.InputProps,
                            ref: params.InputProps.ref,
                            className:
                              'm-0 px-2 py-0 h-10 flex justify-center items-center font-light focus:outline-none focus:ring-0 w-full', // Tailwind styles for input
                            // `ref` must be handled by `Controller`
                          }}
                          variant='outlined'
                          sx={{
                            '& .MuiOutlinedInput-root': {
                              color: 'black', // Text color
                              '& fieldset': {
                                borderColor: 'rgb(220,220,220)',
                              },
                              '&:hover fieldset': {
                                borderColor: 'rgb(220,220,220)',
                              },
                              '&.Mui-focused fieldset': {
                                borderColor: 'black', // Border color when focused
                              },
                            },
                          }}
                        />
                        <h2 className='text-red-800 px-2 text-sm'>
                          {errors.address?.message}
                        </h2>
                      </div>
                    );
                  }}
                />
              )}
            </div>
            <div className='flex flex-col gap-2'>
              <div className='flex flex-col gap-1'>
                <h2 className='text-md sm:text-lg'>Delivery Day</h2>
                <Input
                  className='text-md text-gray-500 text-sm w-[140px]'
                  {...register('time')}
                  type='Date'
                  disabled={!isEdit}
                />
              </div>
              <div className='flex flex-col gap-1'>
                <h2 className='text-md sm:text-lg'>Delivery Slot</h2>
                <label className='w-[200px]'>
                  <Controller
                    name='slot'
                    control={control}
                    defaultValue={orderInfo.Duration}
                    render={({ field: { onChange, value } }) => {
                      return (
                        <Select
                          value={value}
                          onValueChange={onChange}
                          disabled={!isEdit}
                        >
                          <SelectTrigger className='w-full'>
                            <SelectValue placeholder='Duration' />
                          </SelectTrigger>
                          <SelectContent>
                            {slotType &&
                              slotType.map(
                                (slot: { value: string; text: string }) => (
                                  <SelectItem
                                    className='p-2'
                                    key={slot.value}
                                    value={slot.value}
                                  >
                                    <div className='flex justify-between w-full gap-2'>
                                      <h2 className='w-[80px]'>
                                        {slot.text.split(' ')[0]}
                                      </h2>
                                      <h2 className='text-end w-[100px]'>
                                        {slot.text.split(' ')[1]}
                                      </h2>
                                    </div>
                                  </SelectItem>
                                )
                              )}
                          </SelectContent>
                          <h2 className='text-red-800 px-2 text-sm'>
                            {errors.slot?.message}
                          </h2>
                        </Select>
                      );
                    }}
                  />
                </label>
              </div>
            </div>
            {isEdit && (
              <Button type='submit'>
                {changing ? (
                  <Loader className='h-5 w-5 animate-spin' />
                ) : (
                  'Place Change'
                )}
              </Button>
            )}
          </form>
          <div className='flex flex-col gap-2'>
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
              {status === 'Unpaid' && !isEdit && (
                <Button
                  className='bg-green-600 hover:bg-green-700'
                  onClick={PayOrder}
                  disabled={onPay || onCancel || onPick || onChange}
                >
                  {onPay ? (
                    <h2 className='animate-pulse'>Processing...</h2>
                  ) : (
                    <h2>Pay Now</h2>
                  )}
                </Button>
              )}
              {status === 'Delivered' && !isEdit && (
                <Button
                  className='bg-green-600 hover:bg-green-700 w-full'
                  onClick={PickedOrder}
                  disabled={onPay || onCancel || onPick || onChange}
                >
                  {onPick ? (
                    <Loader className='h-5 w-5 animate-spin' />
                  ) : (
                    'Picked Order'
                  )}
                </Button>
              )}
            </div>
            <div className='flex sm:flex-row flex-col gap-2 w-full sm:items-center'>
              <HelpOrder />
              {(status === 'Ordered' || status === 'Unpaid') && !isEdit && (
                <Button
                  className='bg-red-600 hover:bg-red-700'
                  onClick={CancelOrder}
                  disabled={onPay || onCancel || onPick || onChange}
                >
                  {onCancel ? (
                    <Loader className='h-5 w-5 animate-spin' />
                  ) : (
                    'Cancel Order'
                  )}
                </Button>
              )}
              {(status === 'Ordered' || status === 'Unpaid') && !isEdit && (
                <Button
                  className='bg-blue-600 hover:bg-blue-700'
                  onClick={() => setIsEdit(true)}
                  disabled={onPay || onCancel || onPick || onChange}
                >
                  {onChange ? (
                    <Loader className='h-5 w-5 animate-spin' />
                  ) : (
                    'Change Details'
                  )}
                </Button>
              )}
              {(status === 'Delivered' || status === 'Finished') && !isEdit && (
                <Button
                  className='bg-gray-600 hover:bg-gray-700'
                  onClick={ReportOrder}
                  disabled={onPay || onCancel || onPick || onChange}
                >
                  Report Order
                </Button>
              )}
            </div>
          </div>
        </div>
      </CollapsibleContent>
    </Collapsible>
  );
};
