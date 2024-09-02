import {z} from "zod";
import {zodResolver} from "@hookform/resolvers/zod";
import {useForm} from "react-hook-form";
import { LocationInfo, useSearchLocation } from '../lib/debonce';
export const schemaDetail = z.object({
    name: z.string().min(1, "Name is required").max(50, "Name at most have 50 characters"),
    phone: z.string().min(10, "Phone number at least have 10 characters").max(10, "Phone number at most have 10 characters"),
    email: z.string().email("Email must include '@xxx.xx.'"),
    postCode: z.string().min(4, "PostCode at least have 6 characters").max(6, "PostCode at most have 6 characters"),
    address: z.string().min(1, "Address is required").max(100, "Address at most have 100 characters"),
    time: z.string().min(1, "Time is required").max(50, "Time at most have 50 characters"),
    slot: z.enum(["O", "M", "A", "N"],{
      required_error: "Delivery slot is required",
    }),
})
export type FormTypePickDetail = z.infer<typeof schemaDetail>;

export const PickDetail=()=>{
    return useForm<FormTypePickDetail>({
       resolver: zodResolver(schemaDetail),
       defaultValues: {
        name: '',
        email: '',
        phone: '',
        postCode: '',
        address: '',
      }
    })
}
