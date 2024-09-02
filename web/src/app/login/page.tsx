'use client';
import Image from 'next/image';
import { Input } from '@/components/ui/input';
import { Button } from '@/components/ui/button';
import Link from 'next/link';
import { useEffect, useState } from 'react';
import { loginType } from '@/types';
import { Loader } from 'lucide-react';
import GlobalAPI from '@/_utils/GlobalAPI';
import { toast } from '../../_utils/Toast';
import { useRouter } from 'next/navigation';
import { PickLogin } from '@/_forms/LoginForm';
import { useAuth } from '../../_componments/AuthProvider';
import { ForgetPwd } from '@/_componments/forgetPwd';
export default function Page() {
  const {
    register,
    handleSubmit,
    setValue,
    getValues,
    watch,
    formState: { errors },
  } = PickLogin();
  const router = useRouter();
  const { isLogin, login, logout } = useAuth();
  const [loading, setLoading] = useState(false);
  const onLoginAccount = (data: loginType) => {
    GlobalAPI.login(data)
      .then((resp) => {
        console.log('resp: ', resp.data);
        login(resp.data.jwt, resp.data.user);
        toast.success('Welcome to FreshSolder ' + resp.data.user.username);
        setLoading(false);
      })
      .catch((error) => {
        if (error.response.data.error.message) {
          toast.error(error.response.data.error.message);
        } else {
          toast.error('Network Error, try again.');
        }
        setLoading(false);
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
          priority
        />
        <h2 className='text-3xl font-bold mt-4'>Sign in your Account</h2>
        <h2 className='text-gray-600 mt-1'>
          Enter Your Email and Password to Sign in
        </h2>
        <form
          className='w-full flex flex-col gap-5 mt-7'
          onSubmit={handleSubmit(async (data) => {
            setLoading(true);
            await onLoginAccount(data);
          })}
        >
          <div>
            <Input id='email' placeholder='Email' {...register('email')} />
            {errors.email && (
              <p className='text-sm p-2'>{errors.email.message}</p>
            )}
          </div>
          <div>
            <Input
              id='password'
              placeholder='Password'
              {...register('password')}
            />
            {errors.password && (
              <p className='text-sm p-2'>{errors?.password.message}</p>
            )}
          </div>
          <div className='flex flex-col gap-2'>
            <Button
              disabled={loading}
              className='bg-green-700 hover:bg-green-800'
            >
              {loading ? (
                <Loader className='h-4 w-4 animate-spin' />
              ) : (
                'Sign in'
              )}
            </Button>
            <ForgetPwd />
          </div>

          <p>
            Not have an Account{' '}
            <Link href='/Register' className='text-blue-500 underline'>
              Click here
            </Link>{' '}
            to regist
          </p>
        </form>
      </div>
    </div>
  );
}
