'use client';
import Image from 'next/image';
import { Input } from '@/components/ui/input';
import { Button } from '@/components/ui/button';
import Link from 'next/link';
import { useState } from 'react';
import {
  schemaRegist,
  FormTypePickRegist,
  PickRegist,
} from '../../_forms/RegistForm';
import { registerType } from '@/types';
import { zodResolver } from '@hookform/resolvers/zod';
import { Form, useForm } from 'react-hook-form';
import GlobalAPI from '@/_utils/GlobalAPI';
import { toast } from '../../_utils/Toast';
export default function Home() {
  const {
    register,
    handleSubmit,
    setValue,
    getValues,
    watch,
    formState: { errors },
  } = PickRegist();
  const [loading, setLoading] = useState(false);
  const { Username, Email, Password } = watch();
  const onCreateAccount = (data: registerType) => {
    GlobalAPI.register(data)
      .then((resp) => {
        if (resp.data) {
          console.log(resp.data.user);
          console.log(resp.data.jwt);
        }
        setLoading(true);
      })
      .catch((error) => {
        const message = error.response.data.error.message;
        if (message) {
          console.log(message);
          toast.error(message);
        } else {
          // 处理其他类型的错误
          alert('Unexpected error:' + error);
        }
      });
  };
  return (
    <div className='flex items-baseline justify-center mt-10 mb-5'>
      <div className='flex flex-col items-center justify-center p-10 bg-slate-100 border border-gray-200'>
        <Image
          className='h-[120px] w-[120px]'
          src={'/LOGO.png'}
          alt='FreshSolder'
          width={200}
          height={200}
          style={{ height: 'auto' }}
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
            Create an Account
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
