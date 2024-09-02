import Link from 'next/link';
export const Advertise = () => {
  return (
    <>
    <div className='flex flex-col justify-between w-full fixed z-10'>
      <Link href='/Register' className='w-full flex justify-center p-2 bg-green-50 mb-2'>
        <h2 className='text-center text-green-800 underline'>
          {'Create your account '}
        </h2>
        <h2 className='pl-1'> and start shopping now</h2>
      </Link>
    </div>
    <div className='h-[50px]'></div>
    </>
    
  );
};
