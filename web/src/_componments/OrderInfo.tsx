import InputComponment from '../_componments/Input';
import { PickDetail } from '../_forms/DetailForm';
import { PriceBox } from './PriceBox';
import { Controller } from 'react-hook-form';
import { LocationInfo, useSearchLocation } from '../lib/debonce';
import MuiAutocomplete, { AutocompleteProps } from '@mui/material/Autocomplete';
import TextField from '@mui/material/TextField';
import { useState } from 'react';
import { slotType } from '../_utils/constants';
import GlobalAPI from '../_utils/GlobalAPI';
import { parseCookies } from 'nookies';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select';
import { CartItem } from '../types';
import { toast } from '../_utils/Toast';
import { PayPalScriptProvider, PayPalButtons } from '@paypal/react-paypal-js';

import { loadStripe } from '@stripe/stripe-js';
import { set } from 'lodash';

// Define the function to create a booking session
export const createBookingSession = async (
  totalPriceObject: {
    totalPrice: number;
    orderId: number;
  },
  jwt: string
) => {
  try {
    // Call your backend to create a payment session
    await GlobalAPI.MakePayment(
      {
        amount: totalPriceObject.totalPrice,
        orderId: totalPriceObject.orderId,
      },
      jwt
    )
      .then(async (res) => {
        console.log(res);
        const sessionId = await res.data.id;
        // Load the Stripe.js library
        const stripe = await loadStripe(
          process.env.NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY || ''
        );
        if (!stripe) {
          throw new Error('Failed to load Stripe.js');
        }
        // Redirect to Stripe Checkout
        await stripe
          .redirectToCheckout({
            sessionId,
          })
          .catch((error) => {
            console.error('Stripe checkout error:', error);
          });
      })
      .catch((error) => {
        console.log('Error in createBookingSession:', error);
        throw new Error('Failed to create payment session');
      });
  } catch (error) {
    console.error('Error in createBookingSession:', error);
    // Optionally, show an error message to the user
  }
};

export const OrderInfo = ({
  price,
  num,
  loading,
  products,
}: {
  price: number;
  num: number;
  loading: boolean;
  products: CartItem[];
}) => {
  const [ordering, setOrdering] = useState(false);
  const { user, jwt } = parseCookies();
  const {
    register,
    control,
    handleSubmit,
    setValue,
    getValues,
    watch,
    formState: { errors },
  } = PickDetail();
  const {
    loading: l2,
    setLoading,
    LocationInfo,
    searchText,
    setsearchText,
  } = useSearchLocation();

  const onOrderSubmit = async () => {
    setOrdering(true);
    const { name, email, phone, postCode, address, time, slot } = watch();
    const orderResponse = await GlobalAPI.AddOrder(
      {
        name,
        email,
        phone,
        postCode,
        address,
        time,
        slot,
        status: 'Unpaid',
        UserId: JSON.parse(user).id,
        products: products.map((item: CartItem) => {
          return {
            product: item.attributes.product.data.id,
            quantity: item.attributes.quantity,
            TotalPrice: item.attributes.amount * item.attributes.quantity,
          };
        }),
        GST: (delivery + price) * 0.1,
        totalPrice: price + delivery + (price + delivery) * 0.1,
        Subtotal: price,
        DeliveryPrice: delivery,
      },
      jwt
    );
    if (!orderResponse.data.data.id) {
      setOrdering(false);
      throw new Error('Order submission failed');
    }
    // Create a payment session
    const totalPriceObject = {
      totalPrice: Number(
        (price + delivery + (price + delivery) * 0.1).toFixed(2)
      ),
      orderId: orderResponse.data.data.id,
    };
    const deleteCart = products.map(async (item: CartItem) => {
      await GlobalAPI.deleteToCart(item.id, jwt);
    });
    const deleteCartResponse = await Promise.all(deleteCart);
    if(deleteCartResponse.length !== products.length){
      setOrdering(false);
      throw new Error('Delete cart failed');
    }
    await createBookingSession(totalPriceObject, jwt).then((result) => {
      toast.success('Payment Success, Order is preparing.');
      setOrdering(false);
    });
  };
  const [delivery, setDelivery] = useState(0);
  return (
    <form
      className='flex flex-col md:flex-row md:items-between gap-3'
      onSubmit={handleSubmit(onOrderSubmit)} // 简化处理
    >
      <div className='md:w-[60%] flex flex-col justify-around'>
        <h1 className='text-2xl font-bold'>Order Details</h1>
        <div className='grid sm:grid-cols-2 w-full gap-2 items-center'>
          <InputComponment
            label='Name'
            type='text' // 更正 type 属性
            error={errors.name?.message}
            {...register('name')}
          />
          <InputComponment
            label='Email'
            type='email' // 更正 type 属性
            error={errors.email?.message}
            {...register('email')}
          />
          <InputComponment
            label='Phone'
            type='tel' // 更正 type 属性
            error={errors.phone?.message}
            {...register('phone')}
          />
          <InputComponment
            label='PostCode'
            type='text' // 更正 type 属性
            error={errors.postCode?.message}
            {...register('postCode')}
          />
        </div>
        <div className='flex gap-2 items-center'>
          <InputComponment
            label='Delivery Time'
            type='date' // 更正 type 属性
            error={errors.time?.message}
            {...register('time')}
          />
          <div className='w-full items-center flex flex-col'>
            <label className='text-md font-normal w-full'>TimeSlot</label>
            <label className='p-2 w-full'>
              <Controller
                name='slot'
                control={control}
                defaultValue={'O'}
                render={({ field: { onChange, value } }) => {
                  return (
                    <Select value={value} onValueChange={onChange}>
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
        <div className='p-2'>
          <MuiAutocomplete
            autoSelect
            handleHomeEndKeys
            classes={{
              root: 'font-light rounded-md',
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
              setLoading(true);
              setsearchText(v);
            }}
            loading={loading}
            renderInput={(params) => (
              <div className='flex flex-col'>
                <label className='text-md font-normal'>Address</label>
                <TextField
                  classes={{
                    root: 'rounded-lg', // Apply consistent font style
                  }}
                  {...params}
                  {...register('address')} // Use `register` directly on `TextField`
                  id='autocomplete-input'
                  InputProps={{
                    ...params.InputProps,
                    ref: params.InputProps.ref, // Ensure ref is passed correctly
                    className:
                      'm-0 px-2 py-0 h-10 flex justify-center items-center font-light focus:outline-none focus:ring-0', // Tailwind styles for input
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
            )}
          />
        </div>
      </div>
      <div className='md:w-[40%]'>
        <PriceBox
          ordering={ordering}
          price={price}
          num={num}
          loading={loading}
          delivery={delivery}
        />
      </div>
    </form>
  );
};
