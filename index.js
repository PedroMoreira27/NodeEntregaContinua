require('dotenv').config();
const fetch = require('node-fetch');

const BASE_URL = 'http://www.omdbapi.com';

async function getPopularMovies() {
  try {
    const movies = [
      'Inception',
      'The Dark Knight',
      'Interstellar',
      'Avatar',
      'Avengers',
    ];

    console.log('\nFilmes Populares:');
    for (const title of movies) {
      const response = await fetch(
        `${BASE_URL}/?apikey=29bacc79&t=${encodeURIComponent(title)}`
      );
      const movie = await response.json();

      if (movie && movie.Response === 'True') {
        console.log(`\nTítulo: ${movie.Title}`);
        console.log(`Data de Lançamento: ${movie.Released}`);
        console.log(`Avaliação: ${movie.imdbRating}/10`);
        console.log(`Descrição: ${movie.Plot}`);
      } else {
        console.log(`\nNão foi possível encontrar informações para "${title}".`);
      }
    }
  } catch (error) {
    console.error('Erro ao buscar filmes:', error.message);
  }
}

async function searchMovies(query) {
  try {
    const response = await fetch(
      `${BASE_URL}/?apikey=29bacc79&s=${encodeURIComponent(query)}`
    );
    const data = await response.json();

    if (data && data.Response === 'True' && data.Search) {
      const details = await Promise.all(
        data.Search.slice(0, 5).map(async (movie) => {
          const detailResponse = await fetch(
            `${BASE_URL}/?apikey=29bacc79&i=${movie.imdbID}`
          );
          const detail = await detailResponse.json();
          return detail;
        })
      );

      details.forEach((detail) => {
        if (detail && detail.Response === 'True') {
          console.log(`\nTítulo: ${detail.Title}`);
          console.log(`Data de Lançamento: ${detail.Released}`);
          console.log(`Avaliação: ${detail.imdbRating}/10`);
        }
      });
    } else {
      console.log(`Nenhum resultado encontrado para "${query}".`);
    }
  } catch (error) {
    console.error('Erro ao buscar filmes:', error.message);
  }
}

async function main() {
  await getPopularMovies();
  await searchMovies('Avatar');

  setInterval(async () => {
    await getPopularMovies();
    await searchMovies('Avatar');
  }, 300000);

  while (true) {
    await new Promise(resolve => setTimeout(resolve, 10000));
  }
}

main();
