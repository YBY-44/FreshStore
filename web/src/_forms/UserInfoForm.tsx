import {z} from "zod";
import {zodResolver} from "@hookform/resolvers/zod";
import {useForm} from "react-hook-form";
import { LocationInfo, useSearchLocation } from '../lib/debonce';
export const UserInfoDetail = z.object({
    name: z.string().min(4, "Name is required 4 characters").max(50, "Name at most have 50 characters"),
    email: z.string().email("Email must include '@xxx.xx.'"),
})
export type FormTypePickUserInfo = z.infer<typeof UserInfoDetail>;
