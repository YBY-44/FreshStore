import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog';
import { Button } from '@/components/ui/button';
import { Loader } from 'lucide-react';
import { ProductType } from '@/types';
import { ProductSpecificCard } from './ProductSpecificCard';
export const ProductOne = ({
  product,
  loading = false,
}: {
  product: ProductType;
  loading?: boolean;
}) => {
  return (
    <Dialog>
      <DialogTrigger className='cursor-pointer px-4 py-3 border-2 rounded-md font-bold text-green-800 border-green-800 hover:bg-green-800 hover:text-white duration-300'>
        {loading ? <Loader className='h-5 w-5 animate-spin'/> : 'Add to Cart'}
      </DialogTrigger>
      <DialogContent className='max-h-[100vh] overflow-y-scroll'>
        <DialogHeader>
          <DialogTitle>
            In {product?.attributes.categories.data[0].attributes.name} Category
          </DialogTitle>
          <DialogDescription>FreshSolder Product</DialogDescription>
        </DialogHeader>
        <ProductSpecificCard product={product} />
      </DialogContent>
    </Dialog>
  );
};
