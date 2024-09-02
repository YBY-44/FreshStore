import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select';
import { forwardRef } from 'react';
import React, { InputHTMLAttributes } from "react";

const TimeSlotSelect = React.forwardRef<
  HTMLSelectElement,
  InputHTMLAttributes<HTMLSelectElement>
>(({ children, ...props }: InputHTMLAttributes<HTMLSelectElement>, ref) => {
  return (
    <Select>
      <SelectTrigger className='w-[180px]'>
        <SelectValue placeholder='Theme' />
      </SelectTrigger>
      <SelectContent >
        <SelectItem value='O'>OverNight 0:00-6:00</SelectItem>
        <SelectItem value='M'>Morning 6:00-12:00</SelectItem>
        <SelectItem value='A'>AfterNoon 12:00-18:00</SelectItem>
        <SelectItem value='N'>Night 18:00-24:00</SelectItem>
      </SelectContent>
    </Select>
  );
});



TimeSlotSelect.displayName = 'TimeSlotSelect';

export default TimeSlotSelect;