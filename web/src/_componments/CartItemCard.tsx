import { CartItem } from '@/types';
import Image from 'next/image';
import { CircleX } from 'lucide-react';
import GlobalAPI from '@/_utils/GlobalAPI';
import { parseCookies } from 'nookies';
import { toast } from '../_utils/Toast';
import { deleteFromCart } from './Header';
export const CartItemCard = ({
  item,
  index,
  items,
  setPrice,
  setItems,
  setLoading,
  ...props
}: {
  item: CartItem;
  index: number;
  items: CartItem[];
  setPrice: React.Dispatch<React.SetStateAction<number>>;
  setItems: React.Dispatch<React.SetStateAction<CartItem[]>>;
  setLoading: React.Dispatch<React.SetStateAction<boolean>>;
}) => {
  const { jwt } = parseCookies();
  const imageUrl =
      item.attributes.product.data.attributes.Images.data[0].attributes.url ||
    '';
  const { name, Price, mrp, QT } = item.attributes.product.data.attributes;
  const { amount, quantity } = item.attributes;

  return (
    <div
      className={
        'gap-3 flex cursor-pointer p-2 md:p-5 items-center justify-between duration-300 w-full rounded-md h-32 sm:h-[170px] ' +
        (index % 2 === 1 ? 'bg-gray-50' : '')
      }
    >
      <Image
        className='h-20 w-20 sm:h-32 sm:w-32 object-cover rounded-md'
        src={imageUrl}
        alt={name}
        width={1000}
        height={1000}
        priority
      />
      <div className='flex flex-col w-full items-between justify-center px-2 sm:flex-row sm:items-center sm:justify-between'>
        <div className='flex sm:justify-center items-center gap-2'>
          <h2 className='text-sm sm:text-xl max-w-[170px]'>{name}</h2>
          <h2 className='text-gray-700 text-sm sm:text-xl'>{QT}</h2>
          <div className='flex gap-2 items-center justify-center h-full'>
            <h2 className='text-gray-600 text-sm sm:text-xl'>×</h2>
            <h2 className='text-gray-600 text-sm sm:text-xl'>{quantity}</h2>
          </div>
        </div>
        <h2 className='text-sm sm:text-xl text-start sm:text-center w-full sm:w-min'>
          ${amount.toFixed(2)}
        </h2>
      </div>
      <button
        onClick={(e: React.MouseEvent<HTMLButtonElement>) =>
          deleteFromCart(e, items, setItems, setPrice, item.id, jwt, setLoading)
        }
        className='w-min h-min p-2 text-gray-600 hover:scale-125 hover:text-gray-800 duration-300'
      >
        <CircleX className='w-4 h-4 sm:h-8 sm:w-8' />
      </button>
    </div>
  );
};
