export const CategoryBanner = ({ text }: { text: string }) => {
  return (
    <h2
      className='h-[100px] bg-green-800 text-4xl font-bold text-white flex
    justify-center items-center'
    >
      {text === 'CheckOut' || text === 'My Order' || text==='Profile' ? text : 'Fresh ' + text}
    </h2>
  );
};
