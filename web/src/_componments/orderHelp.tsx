'use client';
import React from 'react';
import { useAuth } from './AuthProvider';
import { Loader } from 'lucide-react';
import { useState, useEffect } from 'react';
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog';
import { Button } from '@/components/ui/button';

export const HelpOrder = () => {
  return (
    <Dialog>
      <DialogTrigger className=''>
        <h2>Any Help ?</h2>
      </DialogTrigger>
      <DialogContent className='max-h-[100vh] overflow-y-scroll w-[90%] sm:w-[70%] rounded-md'>
        <DialogHeader>
          <DialogTitle>Order Operation rule</DialogTitle>
          <DialogDescription>
            {'You can check your order status, and the rule of order operation'}
          </DialogDescription>
        </DialogHeader>
        <div>
          <h2 className='text-sm font-bold'>{'Status in Unpaid:'}</h2>
          <h2 className='text-sm'>
            {
              'You can change the Order Details, Pay the order, Cancel the Order.'
            }
          </h2>
        </div>
        <div>
          <h2 className='text-sm font-bold'>{'Status in Ordered:'}</h2>
          <h2 className='text-sm'>
            {
              'You can change the Order Details, Pay the order, Cancel the Order.'
            }
          </h2>
        </div>
        <div>
          <h2 className='text-sm font-bold'>{'Status in Delivering:'}</h2>
          <h2 className='text-sm'>
            {
              'That means your order is on the way to you, you can not change the order details, but you can cancel the order.'
            }
          </h2>
        </div>
        <div>
          <h2 className='text-sm font-bold'>{'Status in Delivered:'}</h2>
          <h2 className='text-sm'>
            {
              'That means your order is delivered, you can not change the order details, can not cancel the order, if you find the product is not what you want or meet some quality problem, when you pick up the product.'
            }
          </h2>
        </div>
        <div>
          <h2 className='text-sm font-bold'>{'Status in Finished'}</h2>
          <h2 className='text-sm'>
            {
              'That means your order is finished, you can only report to us if you find the product is not what you want, or meet some quality problem.'
            }
          </h2>
        </div>
        <div>
          <h2 className='text-sm font-bold'>{'Status in Canceled:'}</h2>
          <h2 className='text-sm'>
            {
              'That means your order is canceled, you can not do anything for that order.'
            }
          </h2>
        </div>
        <div className='flex flex-col items-center text-sm'>
          <h2>Any other question, please contact us by send email to</h2>
          <h2 className='font-bold'>boyangyby@gmail.com</h2>
        </div>
      </DialogContent>
    </Dialog>
  );
};
