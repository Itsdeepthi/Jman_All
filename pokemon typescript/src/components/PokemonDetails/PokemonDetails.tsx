import { FC, useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { Card, CardHeader, CardBody, Heading} from '@chakra-ui/react'
import { Image, Box, Text } from '@chakra-ui/react'

const PokemonDetails: FC = () => {
  const { id } = useParams<{ id: string }>();
  const [pokemon, setPokemon] = useState<any>(null);
  const [height, setHeight] = useState<number>(0);
  const [abilities, setAbilities] = useState<any[]>([]);
  

  useEffect(() => {
    fetch(`https://pokeapi.co/api/v2/pokemon/${id}`)
      .then(response => response.json())
      .then(data => {
        setPokemon(data);
        setHeight(data.height)
        setAbilities(data.abilities)
        console.log(data.abilities)
      })
      .catch(error => {
        console.error('Error fetching Pokemon details:', error);
      });
  }, [id]);

  if (!pokemon) {
    return <div>Loading...</div>;
  }

  return (
    <div className="text-center">
      
      <h3 className="text-4xl font-bold my-2">Pokemon Details page</h3>
      <Card>
  <CardHeader>
    <Heading size='md'>{pokemon.name}</Heading>
  </CardHeader>
  <CardBody>
    <center>
  <Image
    boxSize='150px'
    objectFit='cover'
    src={`https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${id}.png`} alt={pokemon.name} 
  />
  </center>
  <div style={{ marginBottom: '20px' }}> 
  <Box>
    <Heading size='xs' textTransform='uppercase'>
      Height
    </Heading>
    <Text pt='2' fontSize='sm'>
      {height}
    </Text>
  </Box>
</div>
<div style={{ marginTop: '0px' }}> 
  <Box>
    <Heading size='xs' textTransform='uppercase'>
      Abilities
    </Heading>
    <Text pt='2' fontSize='sm'>
      {abilities.map((abi:any,index:any) => (
        <p key={index}>{abi.ability.name}</p>
      ))}
    </Text>
  </Box>
</div>

  </CardBody>
      <div className='flex text-center'>
      </div>
    </Card>
     
    </div>
  );
};

export default PokemonDetails;
