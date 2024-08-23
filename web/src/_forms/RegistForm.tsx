import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { z } from "zod";
export const schemaRegist = z.object({
  Username: z.string().min(4, "Minimum length is 1." ).max(20,  "Maximum length is 20." ),
  Email: z.string().email("Email must include '@xxx.xx.'"),
  Password: z.string().min(6,"Password at least have 6 characters.").max(16,"Password at most have 20 characters."),
});
export type FormTypePickRegist = z.infer<typeof schemaRegist>;

export const PickRegist = () => {
  return useForm<FormTypePickRegist>({
    resolver: zodResolver(schemaRegist)
  });
};
