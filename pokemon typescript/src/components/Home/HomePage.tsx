import { FC, useEffect, useState } from 'react';
import { Link} from 'react-router-dom';
import { Card, Image, CardBody, Heading, Stack, ButtonGroup } from '@chakra-ui/react';
import { Button} from '@chakra-ui/react';

interface Pokemon {
  name: string;
  url: string;
}

const HomePage: FC = () => {
  const [pokemonList, setPokemonList] = useState<Pokemon[]>([]);
  const [nextPage, setNextPage] = useState<string | null>(null);
  const [previousPage, setPreviousPage] = useState<string | null>(null);
  const [offset, setOffset] = useState<number>(0);

  useEffect(() => {
    fetchData('https://pokeapi.co/api/v2/pokemon');
  }, []);

  const fetchData = (url: string) => {
    fetch(`${url}?offset=${offset}`)
      .then(response => response.json())
      .then(data => {
        setPokemonList(data.results);
        setNextPage(data.next);
        setPreviousPage(data.previous);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  };

  const handleNextPage = () => {
    if (nextPage) {
      setOffset(prevOffset => prevOffset + 20);
      fetchData(nextPage);
    }
  };

  const handlePreviousPage = () => {
    if (previousPage) {
      setOffset(prevOffset => prevOffset - 20); 
      fetchData(previousPage);
    }
  };

  return (
    <div className="text-center">
      <h3 className="text-4xl font-bold my-2">Pokemon Listing page</h3>
      <div style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'center' }}>
        {pokemonList.map((pokemon, index) => (
          <div key={index} style={{ margin: '10px', width: '300px' }}>
            <Link to={`/pokemon/${index + offset + 1}`}>
              <Card>
                <CardBody>
                  <Image
                    src={`https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + offset + 1}.png`}
                    borderRadius='lg'
                  />
                  <Heading size='md'>{pokemon.name}</Heading>
                </CardBody>
              </Card>
            </Link>
          </div>
        ))}
      </div>

      <Stack spacing={15} direction='row' align='center'>
      <ButtonGroup gap='1135'>
        {previousPage && <Button onClick={handlePreviousPage} colorScheme='teal' size='md'>Previous</Button>}
        {nextPage && <Button onClick={handleNextPage} colorScheme='teal' size='md'>Next</Button>}
        </ButtonGroup>
      </Stack>
    </div>
  );
};

export default HomePage;
