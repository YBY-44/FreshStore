import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { z } from "zod";
export const schemaRepeat = z.object({
  RepeatPassword: z.string().min(1, "Password can not be empty."),
  Password: z.string().min(6,"Password at least have 6 characters.").max(16,"Password at most have 20 characters."),
});
export type FormTypePickRepeat = z.infer<typeof schemaRepeat>;

export const PickRepeat = () => {
  return useForm<FormTypePickRepeat>({
    resolver: zodResolver(schemaRepeat)
  });
};
