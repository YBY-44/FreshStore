import {z} from "zod";
import {zodResolver} from "@hookform/resolvers/zod";
import {useForm} from "react-hook-form";

export const schemaLogin = z.object({
    email: z.string().email("Email must include '@xxx.xx.'"),
    password: z.string().min(6, "Password at least have 6 characters.").max(16, "Password at most have 20 characters.")
})
export type FormTypePickLogin = z.infer<typeof schemaLogin>;

export const PickLogin=()=>{
    return useForm<FormTypePickLogin>({
       resolver: zodResolver(schemaLogin)
    })
}
