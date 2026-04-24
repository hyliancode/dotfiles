use rand::seq::SliceRandom;
use rand::Rng;

fn main() {
    let user_pattern = "cvccvccvcv";
    let pass_pattern = "cvccvc-cvccvc-cvccvc";
    let consonants: Vec<char> = "bcdfghjklmnpqrstvwxyz".chars().collect();
    let vowels: Vec<char> = "aeiou".chars().collect();
    let mut rng = rand::thread_rng();

    for _ in 0..6 {
        let username: String = user_pattern.chars().map(|c| {
            if c == 'c' { *consonants.choose(&mut rng).unwrap() }
            else { *vowels.choose(&mut rng).unwrap() }
        }).collect();

        let mut pass_chars: Vec<char> = pass_pattern.chars().map(|c| {
            match c {
                'c' => *consonants.choose(&mut rng).unwrap(),
                'v' => *vowels.choose(&mut rng).unwrap(),
                _ => c,
            }
        }).collect();

        let c_indices: Vec<usize> = pass_chars.iter().enumerate()
            .filter(|&(i, _)| pass_pattern.chars().nth(i).unwrap() == 'c')
            .map(|(i, _)| i)
            .collect();

        if let Some(&cap_idx) = c_indices.choose(&mut rng) {
            pass_chars[cap_idx] = pass_chars[cap_idx].to_uppercase().next().unwrap();
        }

        if let Some(&num_idx) = c_indices.choose(&mut rng) {
            pass_chars[num_idx] = char::from_digit(rng.gen_range(0..10), 10).unwrap();
        }

        let password: String = pass_chars.into_iter().collect();
        println!("U: {} | P: {}", username, password);
    }
}