'use client';
import React, { useEffect, useState } from 'react';
import { useAuth } from '../../_componments/AuthProvider';
import { parseCookies } from 'nookies';
import { CategoryBanner } from '@/_componments/CategoryBanner';
import GlobalAPI from '@/_utils/GlobalAPI';
import InputComponent from '../../_componments/Input';
import { UserInformation } from '../../types';
import moment from 'moment';
import { Button } from '../../components/ui/button';
import { useForm } from 'react-hook-form';
import {
  FormTypePickUserInfo,
  UserInfoDetail,
} from '../../_forms/UserInfoForm';
import { zodResolver } from '@hookform/resolvers/zod';
import { toast } from 'react-toastify';
import { Loader } from 'lucide-react';
export default function Page() {
  const [loading, setLoading] = useState(false);
  const [edit, setEdit] = useState(false);
  const { jwt, user } = parseCookies();
  const [jwts, setJwt] = useState<string>('');
  const [profile, setProfile] = useState<UserInformation>();
  const [editIng, setEditIng] = useState(false);
  const {
    handleSubmit,
    register,
    getValues,
    setValue,
    formState: { errors },
    watch,
  } = useForm<FormTypePickUserInfo>({
    resolver: zodResolver(UserInfoDetail),
    defaultValues: {
      name: profile?.username || '',
      email: profile?.email || '',
    },
  });
  const { name, email } = watch();
  const fetchProfile = () => {
    setLoading(true);
    if (!jwt) {
      toast.error('Please login to view profile');
      setProfile(undefined);
      setLoading(false);
      return;
    }
    GlobalAPI.getProfile(jwt)
      .then((resp) => {
        console.log('resp: ', resp.data);
        setValue('name', resp.data.username);
        setValue('email', resp.data.email);
        setLoading(false);
        setProfile(resp.data);
      })
      .catch((error) => {
        setLoading(false);
        console.log('error: ', error);
      });
  };
  useEffect(() => {
    if (!jwt) {
      toast.error('Please login to view profile');
      setProfile(undefined);
      return;
    }
    setJwt(jwt);
    fetchProfile();
  }, [jwt]);
  return (
    <div className=''>
      <CategoryBanner text={'Profile'} />
      <h2 className='py-8 text-3xl font-bold text-primary mx-7 md:mx-20'>
        Account Information
      </h2>
      <form
        className='mb-8 mx-7 md:mx-20 gap-5 flex flex-col border rounded-md p-5'
        onSubmit={handleSubmit(async () => {
          if (!user || !jwt) {
            toast.error('Please login to view profile');
            return;
          }
          console.log('getValues: ', name, email);
          setEditIng(true);
          await GlobalAPI.editProfile(
            jwt,
            {
              username: name,
              email: email,
            },
            JSON.parse(user).id
          )
            .then((resp) => {
              toast.success('Update profile successfully');
              console.log('resp: ', resp);
              setEdit(false);
              setEditIng(false);
            })
            .catch((error) => {
              toast.error('Update profile failed, try again');
              console.log('error: ', error);
              setEditIng(false);
            });
        })}
      >
        <h2 className='w-full text-xl text-center'>Basic Information</h2>
        {loading && (
          <div className='flex w-full justify-center'>
            <Loader className='h-15 w-15 animate-spin' />
          </div>
        )}
        <InputComponent
          label='Username'
          type='text'
          error={errors.name?.message}
          disabled={!edit}
          {...register('name')}
        />
        <InputComponent
          label='Email'
          type='text'
          error={errors.email?.message}
          disabled={!edit}
          {...register('email')}
        />
        <div className='flex justify-between px-3'>
          <h2>Status</h2>
          {jwts && (
            <h2
              className={
                '' + profile?.blocked ? ' text-green-600 ' : ' text-red-700 '
              }
            >
              {profile?.blocked ? 'Blocked' : 'Active'}
            </h2>
          )}
        </div>
        <div className='flex justify-between px-3'>
          <h2>Confirmation</h2>
          {jwts ? (
            <h2
              className={
                '' + profile?.confirmed ? ' text-green-600 ' : ' text-red-700 '
              }
            >
              {profile?.confirmed ? 'Confirmed' : 'Not Confirmed'}
            </h2>
          ) : (
            <h2>-</h2>
          )}
        </div>
        <div className='flex justify-between px-3'>
          <h2>Created at:</h2>

          {jwts ? (
            <h2>{moment(profile?.createdAt).format('DD/MMM/yyyy hh:mm')}</h2>
          ) : (
            <h2>-</h2>
          )}
        </div>
        <div className='flex justify-between px-3'>
          <h2>Updated at:</h2>
          {jwts ? (
            <h2>{moment(profile?.updatedAt).format('DD/MMM/yyyy hh:mm')}</h2>
          ) : (
            <h2>-</h2>
          )}
        </div>
        {jwts ? (
          <Button
            className={
              !edit
                ? 'bg-gray-200 hover:bg-gray-300 text-black'
                : 'bg-green-600 hover:bg-green-700'
            }
            onClick={(e) => {
              if (!edit) {
                e.preventDefault();
                setEdit(true);
              }
            }}
            type={edit ? 'submit' : 'button'}
          >
            {editIng ? (
              <Loader className='h-5 w-5 animate-spin' />
            ) : edit ? (
              'Click to Save'
            ) : (
              'Click to Edit'
            )}
          </Button>
        ) : null}
      </form>
    </div>
  );
}
