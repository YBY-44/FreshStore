'use client';
import Image from 'next/image';
import { Input } from '@/components/ui/input';
import { Button } from '@/components/ui/button';
import Link from 'next/link';
import { useState } from 'react';
import { PickRegist } from '../../_forms/RegistForm';
import { useEffect } from 'react';
import { registerType } from '@/types';
import GlobalAPI from '@/_utils/GlobalAPI';
import { toast } from '../../_utils/Toast';
import { useRouter } from 'next/navigation';
import { Loader } from 'lucide-react';
import { useAuth } from '../../_componments/AuthProvider';
export default function Page() {
  const { isLogin, login, logout } = useAuth();
  const {
    register,
    handleSubmit,
    setValue,
    getValues,
    watch,
    formState: { errors },
  } = PickRegist();
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const onCreateAccount = (data: registerType) => {
    GlobalAPI.register(data)
      .then((resp) => {
        if (resp.data) {
          setLoading(true);
          login(resp.data.jwt, resp.data.user);
          router.push('/');
          toast.success('Welcome to FreshSolder ' + resp.data.user.username);
        }
      })
      .catch((error) => {
        const message = error.response.data.error.message;
        if (message) {
          console.log(message);
          toast.error(message);
        } else {
          toast.error('Network Error, try again.');
        }
        setLoading(false);
      });
  };
  useEffect(() => {
    if (isLogin) {
      router.push('/');
    }
  });
  return (
    <div className='flex items-baseline justify-center mt-10 mb-5'>
      <div className='flex flex-col items-center justify-center p-10 bg-slate-100 border border-gray-200'>
        <Image
          className='h-[200px] w-[200px]'
          src={'/LOGO.png'}
          alt='FreshSolder'
          width={200}
          height={200}
          priority
        />
        <h2 className='text-3xl font-bold my-4'>Create an Account</h2>
        <h2>Enter Your Email and Password to Create an account</h2>
        <form
          className='w-full flex flex-col gap-5 mt-7'
          onSubmit={handleSubmit(async (data) => {
            setLoading(true);
            await onCreateAccount(data);
          })}
        >
          <div>
            <Input
              id='Username'
              placeholder='Username'
              {...register('Username')}
            />
            {errors.Username && (
              <p className='text-sm p-2'>{errors?.Username.message}</p>
            )}
          </div>
          <div>
            <Input id='Email' placeholder='Email' {...register('Email')} />
            {errors.Email && (
              <p className='text-sm p-2'>{errors.Email.message}</p>
            )}
          </div>
          <div>
            <Input
              id='Password'
              placeholder='Password'
              {...register('Password')}
            />
            {errors.Password && (
              <p className='text-sm p-2'>{errors?.Password.message}</p>
            )}
          </div>
          <Button
            disabled={loading}
            className='bg-green-700 hover:bg-green-800'
          >
            {loading ? <Loader className='w-5 h-5 animate-spin' /> : 'Create an Account'}
          </Button>
          <p>
            Already have an Account{' '}
            <Link href='/login' className='text-blue-500 underline'>
              Click here
            </Link>{' '}
            to login
          </p>
        </form>
      </div>
    </div>
  );
}
