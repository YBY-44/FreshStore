'use client';
import React from 'react';
import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { Button } from '@/components/ui/button';
import { parse } from 'path';
import { parseCookies } from 'nookies';
import { Input } from '../../components/ui/input';
import GlobalAPI from '@/_utils/GlobalAPI';
import { toast } from 'react-toastify';
import { PickRepeat } from '../../_forms/ResetPassword';
import { error } from 'console';
import { Loader } from 'lucide-react';
import { set } from 'lodash';
export default function Page() {
  const {
    handleSubmit,
    watch,
    register,
    formState: { errors },
  } = PickRepeat();
  const [loading, setLoading] = useState(false);
  const { Password, RepeatPassword } = watch();
  const [Code, setCode] = useState('');
  const urlParams = new URLSearchParams(window.location.search);
  const code = urlParams.get('code'); // 获取 'code' 参数
  const route = useRouter();
  useEffect(() => {
    console.log('Code:', code);
    setCode(code || '');
  }, []);

  return (
    <form
      className='mx-[10%] my-10 p-10 border-2 border-gray-300 rounded-lg  w-[80%] flex flex-col gap-10 justify-center'
      onSubmit={handleSubmit(async () => {
        setLoading(true);
        if (!code) {
          toast.error('No premission to reset password.');
          setLoading(false);
          return;
        }
        if (Password !== RepeatPassword) {
          toast.error('Password not match.');
          setLoading(false);
          return;
        }
        await GlobalAPI.ResetPassword({
          code: Code,
          password: Password,
          passwordConfirmation: RepeatPassword,
        })
          .then((resp) => {
            if (resp.data) {
              route.push('/Login');
              toast.success('Password reset successfully.');
              setLoading(false);
            }
          })
          .catch((error) => {
            if (
              error.response.data.error.message === 'Incorrect code provided'
            ) {
              toast.error(
                'Session Expired, please resend the email in login page.'
              );
            } else {
              toast.error('Network Error, try again.');
            }
            setLoading(false);
            console.log(error);
          });
      })}
    >
      <h2 className='text-center font-bold text-xl'>Password Reset Form</h2>
      {/* <div>
        <h2>Confirm your email</h2>
        <Input
          {...register('Email')}
          className='outline-none border-black'
          type='text'
          placeholder='Enter your registed email to reset password'
        />
      </div> */}
      <div>
        <h2>New Password</h2>
        <Input
          {...register('Password')}
          className='outline-none border-black'
          type='text'
          placeholder='Enter your new password'
        />
        <h2>{errors.Password?.message}</h2>
      </div>
      <div>
        <h2>Repeat Password</h2>
        <Input
          {...register('RepeatPassword')}
          className='outline-none border-black'
          type='text'
          placeholder='Repeat your new password'
        />
        <h2>{errors.RepeatPassword?.message}</h2>
      </div>
      <Button>
        {loading ? (
          <Loader className='animate-spin h-5 w-5' />
        ) : (
          'Reset Password'
        )}
      </Button>
    </form>
  );
}
