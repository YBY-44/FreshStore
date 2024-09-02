import React, { forwardRef } from 'react';
import { Input } from '../components/ui/input'; // Ensure this component can handle refs

interface InputComponentProps {
  label: string;
  type: string;
  error?: string;
  disabled?: boolean;
}

const InputComponent = forwardRef<HTMLInputElement, InputComponentProps>(
  ({ label, type, error, disabled, ...props }, ref) => {
    return (
      <div className='p-2 gap-2'>
        <label>{label}</label>
        <Input
          ref={ref}
          type={type}
          placeholder={label}
          {...props}
          disabled={disabled}
        />
        {error && <p className='text-red-800 text-sm px-2'>{error}</p>}
      </div>
    );
  }
);

InputComponent.displayName = 'InputComponent';

export default InputComponent;
