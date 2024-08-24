-- Buscando Relatórios de Cena do Crime
SELECT description
FROM crime_scene_reports
WHERE MONTH(report_date) = 7 AND DAY(report_date) = 28
AND street = 'Humphrey Street';

-- Procurando Pistas nas Entrevistas
SELECT name, transcript
FROM interviews
WHERE MONTH(interview_date) = 7 AND DAY(interview_date) = 28;

-- Seguindo a Dica da Ruth
SELECT activity, license_plate
FROM bakery_security_logs
WHERE MONTH(log_date) = 7 AND DAY(log_date) = 28
AND hour = 10
AND minute BETWEEN 15 AND 25;

-- Seguindo a Dica do Eugene
SELECT account_number, amount
FROM atm_transactions
WHERE MONTH(transaction_date) = 7 AND DAY(transaction_date) = 28 AND YEAR(transaction_date) = 2023
AND atm_location = 'Leggett Street' AND transaction_type = 'withdraw';

-- Atualizando a Tabela de Chamadas Telefônicas
ALTER TABLE phone_calls
ADD COLUMN caller_name TEXT;

ALTER TABLE phone_calls
ADD COLUMN receiver_name TEXT;

UPDATE phone_calls
JOIN people ON phone_calls.caller = people.phone_number
SET phone_calls.caller_name = people.name;

UPDATE phone_calls
JOIN people ON phone_calls.receiver = people.phone_number
SET phone_calls.receiver_name = people.name;

-- Encontrando o Voo Mais Cedo em 29 de Julho de 2023
SELECT id, hour, minute, origin_airport_id, destination_airport_id
FROM flights
WHERE YEAR(flight_date) = 2023
AND MONTH(flight_date) = 7
AND DAY(flight_date) = 29
ORDER BY hour ASC
LIMIT 1;

-- Atualizando a Tabela de Voos com Cidades dos Aeroportos
UPDATE flights
JOIN airports ON flights.origin_airport_id = airports.id
SET flights.origin_airport_id = airports.city;

UPDATE flights
JOIN airports ON flights.destination_airport_id = airports.id
SET flights.destination_airport_id = airports.city;

-- Juntando Tabelas de Voos e Pessoas
SELECT flights.destination_airport_id, people.name, people.phone_number, people.license_plate
FROM people
JOIN passengers ON people.id = passengers.person_id
JOIN flights ON flights.id = passengers.flight_id
WHERE flights.id = 36
ORDER BY flights.hour ASC;
