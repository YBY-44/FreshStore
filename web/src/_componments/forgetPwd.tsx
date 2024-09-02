'use client';
import React from 'react';
import { useAuth } from './AuthProvider';
import {Loader} from 'lucide-react';
import { useState, useEffect } from 'react';
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog';
import {COUNT_DOWN} from '../_utils/constants';
import { Button } from '@/components/ui/button';
import { parse } from 'path';
import { parseCookies } from 'nookies';
import { Input } from '../components/ui/input';
import GlobalAPI from '@/_utils/GlobalAPI';
import { toast } from 'react-toastify';
import { set } from 'lodash';
export const ForgetPwd = () => {
  const { jwt, user } = parseCookies();
  const [email, setEmail] = useState('');
  const [loading, setLoading] = useState(false);
  const [expectedcode, setExpectedCode] = useState('');
  const [code, setCode] = useState('');
  const [isSend, setIsSend] = useState(false);
  const [isVerify, setIsVerify] = useState(false);
  const [countdown, setCountdown] = useState(0);  // 倒计时的秒数
  const send = () => {
    if (!email) {
      toast.error('Please enter your email.');
      return;
    }
    setCountdown(COUNT_DOWN);
    setLoading(true);
    GlobalAPI.sendEmail(email)
      .then((resp) => {
        if (resp.data) {
          console.log(resp.data);
          setExpectedCode(resp.data.code);
          setIsSend(true);
          setLoading(false);
          toast.success(
            'We send you a link to reset your password, check your email please.'
          );
        }
      })
      .catch((error) => {
        toast.error('Network Error, try again.');
        console.log(error);
        setLoading(false);
      });
  };
  useEffect(() => {
    let timer: NodeJS.Timeout;
    if (countdown > 0) {
      timer = setTimeout(() => {
        setCountdown(countdown - 1);
      }, 1000);
    }
    return () => clearTimeout(timer);
  }, [countdown]);

  return (
    <Dialog>
      <DialogTrigger className='bg-white text-sm cursor-pointer p-2 border-2 rounded-md font-bold text-green-800 border-green-800 hover:bg-gray-100 duration-300'>
        Forget Password
      </DialogTrigger>
      <DialogContent className='max-h-[100vh] overflow-y-scroll w-[90%] sm:w-[70%] rounded-md'>
        <DialogHeader>
          <DialogTitle>Password Reset</DialogTitle>
          <DialogDescription>
            {isSend ? 'Please check your email and click the link to reset your password.':'We will send you a Link to reset your password, via registed email.'}
          </DialogDescription>
        </DialogHeader>
        <form className='w-full flex flex-col gap-5 ' onSubmit={() => {}}>
          <div className='flex gap-2'>
            <Input
              className='border border-black'
              type='text'
              placeholder='Email'
              value={email}
              onChange={(e) => {
                setEmail(e.target.value);
              }}
            />
            <Button onClick={send} type='button' className='w-[155px]' disabled={countdown!=0}>
              {loading ? (<h2 className='text-sm flex gap-2'>Sending <Loader className='h-5 w-5 animate-spin'/></h2>) : isSend ? ( countdown===0 ? 'Resend': 'Resend in '+countdown+'s') : 'Send Code'}
            </Button>
          </div>
        </form>
      </DialogContent>
    </Dialog>
  );
};
