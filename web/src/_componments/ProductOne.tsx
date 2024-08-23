import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog';
import { Button } from '@/components/ui/button';
import  Image from 'next/image';
import { ProductType } from '@/types';
import { ProductSpecificCard } from './ProductSpecificCard';
export const ProductOne = ({ product }: { product: ProductType }) => {
  return (
    <Dialog>
      <DialogTrigger className='px-4 py-3 border-2 rounded-md font-bold text-green-600 border-green-500 hover:border-gray-500 hover:text-gray-800'>
        Add to Cart
      </DialogTrigger>
      <DialogContent className="max-h-[100vh] overflow-y-scroll">
        <DialogHeader>
          <DialogTitle>In {product?.attributes.categories.data[0].attributes.name} Category</DialogTitle>
          <DialogDescription>
              FreshSolder Product
          </DialogDescription>
        </DialogHeader>
        <ProductSpecificCard product={product}/>
      </DialogContent>
    </Dialog>
  );
};
