'use client';
import { ProductType } from '../types';
import { useState, useEffect } from 'react';
import Image from 'next/image';
import { Button } from '@/components/ui/button';
import { ShoppingBasket } from 'lucide-react';
import { zodResolver } from '@hookform/resolvers/zod';
import { set, useForm } from 'react-hook-form';
import { parseCookies } from 'nookies';
import { useRouter } from 'next/navigation';
import { schemaNumber } from '@/_forms/PurchaseNumber';
import GlobalAPI from '@/_utils/GlobalAPI';
import { toast } from 'react-toastify';
import { Loader } from 'lucide-react';
import { eventBus } from '../_utils/event';
export const getCartNumber = async (user: string, jwt: string) => {
  if (!jwt || !user) return [];
  const info = await GlobalAPI.CartNumber(JSON.parse(user).id, jwt)
    .then((resp) => {
      console.log('resp: ', resp);
      return resp.data.data;
    })
    .catch((error) => {
      console.log(error);
    });
  return info;
};
export const ProductSpecificCard = ({ product }: { product: ProductType }) => {
  const cookies = parseCookies();
  const router = useRouter();
  const { jwt, user } = cookies;
  const [loading, setLoading] = useState<boolean>(false);
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
    defaultValues: { amount: 1 },
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
    setTp(Number(amount) * price);
  };
  useEffect(() => {
    claculatePrice(
      Number(amount),
      product.attributes.Price || product.attributes.mrp
    );
  }, [amount, product.attributes.Price, product.attributes.mrp]);
  const imageUrl =
    process.env.NEXT_PUBLIC_ICON_URL +
      product.attributes.Images?.data[0]?.attributes?.url || '';

  const BuySubmit = async () => {
    if (!jwt) {
      router.push('/login');
      setLoading(false);
      return;
    }
    const data = {
      data: {
        quantity: Number(amount),
        amount: Tp,
        product: product.id.toString(),
        users_permissions_user: JSON.parse(user).id,
        UserId: JSON.parse(user).id,
      },
    };
    console.log('data: ', data);
    GlobalAPI.addToCart(data, jwt)
      .then(async (resp) => {
        setLoading(false);
        toast.success('Product added to cart.');
        eventBus.emit('ItemAdded', await getCartNumber(user, jwt));
      })
      .catch((err) => {
        if (err.response.data.error.message) {
          toast.error(err.response.data.error.message);
        } else {
          toast.error('Network Error, try again.');
        }
        setLoading(false);
      });
  };
  return (
    <div className='grid grid-cols-1 md:grid-cols-2 text-black overflow-y-scroll gap-5'>
      <Image
        className='w-full h-[300px] cursor-pointer object-cover rounded-md'
        src={imageUrl || ''}
        alt={product?.attributes.name || ''}
        width={300}
        height={300}
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
        <form
          className='flex flex-col items-center pt-2 pb-5 gap-8'
          onSubmit={handleSubmit(async () => {
            setLoading(true);
            await BuySubmit();
          })}
        >
          <div className='items-center flex justify-between rounded-full bg-gray-100'>
            <button
              onClick={() => decrement()}
              className='rounded-l-full bg-gray-300 text-xl w-8 h-8 flex items-center justify-center text-gray-800'
              type='button'
              disabled={loading}
            >
              -
            </button>
            <input
              className='text-xl text-center w-[50px] h-8 mx-2 justify-center flex outline-none bg-gray-100'
              maxLength={2}
              {...register('amount', { valueAsNumber: true })}
            />
            <button
              onClick={() => increment()}
              className='rounded-r-full bg-gray-300 text-xl w-8 h-8 flex items-center justify-center text-gray-800'
              type='button'
              disabled={loading}
            >
              +
            </button>
          </div>
          {errors.amount && <p className='text-sm'>{errors.amount.message}</p>}
          <Button
            disabled={loading}
            variant={'outline'}
            className='text-green-600 border-green-600 hover:border-gray-800'
            type='submit'
          >
            {loading ? (
              <Loader className='loader h-5 w-5 animate-spin' />
            ) : (
              <>
                <ShoppingBasket />
                Add to Cart {` ${Tp ? ' ($' + Tp.toFixed(2) + ')' : ''}`}
              </>
            )}
          </Button>
        </form>
      </div>
    </div>
  );
};
