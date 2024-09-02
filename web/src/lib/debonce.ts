import { debounce } from 'lodash';
import { useEffect, useState } from 'react';
export type LocationInfo = { placeName: string };
export const useDebounce = <T>(value: T, delay = 1000): T => {
  const [debouncedValue, setDebouncedValue] = useState<T>(value);
  useEffect(() => {
    const handler = setTimeout(() => {
      setDebouncedValue(value);
    }, delay);
    return () => {
      clearTimeout(handler);
    };
  }, [value, delay]);
  return debouncedValue;
};

export const useSearchLocation = () => {
  const [searchText, setsearchText] = useState('');
  const [loading, setLoading] = useState(false);
  const [LocationInfo, setLocationInfo] = useState<LocationInfo[]>(() => {
    return [];
  });
  const debouncedSearchText = useDebounce(searchText, 400);
  useEffect(() => {
    setLoading(true);
    fetch(
      `https://api.mapbox.com/geocoding/v5/mapbox.places/${debouncedSearchText}.json?access_token=${process.env.NEXT_PUBLIC_MAXBOX_TOKEN}`
    )
      .then((response) => {
        return response.json();
      })
      .then((data) => {
        const filtered = data.features?.map((feature: any) => {
          return {
            placeName: feature.place_name,
            latLng: [feature.center[1], feature.center[0]],
          };
        });
        setLocationInfo(filtered);
      });
  }, [debouncedSearchText]);
  return { loading, setLoading, LocationInfo, searchText, setsearchText };
};
