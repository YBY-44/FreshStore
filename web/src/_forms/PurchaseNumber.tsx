import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { z } from "zod";
export const schemaNumber = z.object({
  amount: z.number().min(1, { message: "minimum amout is 1" }).max(99, { message: "maximum amount is 99" }),
});
export type FormTypePickNumber = z.infer<typeof schemaNumber>;

export const PickNumber = () => {
  return useForm<FormTypePickNumber>({
    resolver: zodResolver(schemaNumber)
  });
};
