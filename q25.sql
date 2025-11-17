SELECT
    l.pays,
    COUNT(*) AS volume_transactions,
    SUM(CASE WHEN i.est_frauduleux = 1 THEN 1 ELSE 0 END) AS nb_fraudes,
    SUM(CASE WHEN i.est_frauduleux = 1 THEN f.montant_total ELSE 0 END) AS montant_frauduleux_perdu,
    (SUM(CASE WHEN i.est_frauduleux = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS taux_fraude_pct
FROM
    FAIT_TRANSACTIONS_DETAILLE f
JOIN
    VUE_LIEUX_DETAILLE l ON f.lieu_id = l.lieu_id
JOIN
    VUE_INFO_TRANSACTION_DETAILLE i ON f.info_transaction_id = i.info_transaction_id
GROUP BY
    l.pays
ORDER BY
    montant_frauduleux_perdu DESC;


SELECT
    op.type_canal,
    op.type_dispositif,
    op.libelle_operation,
    AVG(f.score_fraude) AS score_fraude_moyen,
    COUNT(*) AS nb_transactions
FROM
    FAIT_TRANSACTIONS_DETAILLE f
JOIN
    VUE_MODES_OPERATION_DETAILLE op ON f.mode_operation_id = op.mode_operation_id
GROUP BY
    op.type_canal,
    op.type_dispositif,
    op.libelle_operation
ORDER BY
    score_fraude_moyen DESC;


SELECT
    c.profession,
    c.segment_comportemental,
    COUNT(*) AS nb_transactions_suspectes
FROM
    FAIT_TRANSACTIONS_DETAILLE f
JOIN
    VUE_CLIENTS_DETAILLE c ON f.client_id = c.client_id
JOIN
    VUE_INFO_TRANSACTION_DETAILLE i ON f.info_transaction_id = i.info_transaction_id
WHERE
    i.est_frauduleux = 1 OR i.est_bloque = 1
GROUP BY
    c.profession,
    c.segment_comportemental
ORDER BY
    nb_transactions_suspectes DESC;


SELECT * FROM (
    SELECT
        m.categorie_marchand,
        COUNT(*) AS volume_transactions,
        SUM(f.montant_total) AS montant_total_depense
    FROM
        FAIT_TRANSACTIONS_DETAILLE f
    JOIN
        VUE_MARCHANDS_DETAILLE m ON f.marchand_id = m.marchand_id
    GROUP BY
        m.categorie_marchand
    ORDER BY
        volume_transactions DESC
)
WHERE ROWNUM <= 10;


SELECT
    dev.nom_devise,
    SUM(CASE WHEN op.libelle_operation = 'depot' THEN f.montant_total ELSE 0 END) AS total_depots,
    SUM(CASE WHEN op.libelle_operation IN ('retrait', 'paiement', 'virement') THEN f.montant_total ELSE 0 END) AS total_sorties,
    (SUM(CASE WHEN op.libelle_operation = 'depot' THEN f.montant_total ELSE 0 END) -
    SUM(CASE WHEN op.libelle_operation IN ('retrait', 'paiement', 'virement') THEN f.montant_total ELSE 0 END)) AS balance_nette
FROM
    FAIT_TRANSACTIONS_DETAILLE f
JOIN
    VUE_DEVISES_DETAILLE dev ON f.devise_id = dev.devise_id
JOIN
    VUE_MODES_OPERATION_DETAILLE op ON f.mode_operation_id = op.mode_operation_id
WHERE
    dev.est_crypto = 0
GROUP BY
    dev.nom_devise
ORDER BY
    dev.nom_devise;


SELECT
    p.nom_plan,
    SUM(f.frais) AS total_frais_percus,
    SUM(f.cashback_gagne) AS total_cashback_verse,
    (SUM(f.frais) - SUM(f.cashback_gagne)) AS benefice_net
FROM
    FAIT_TRANSACTIONS_DETAILLE f
JOIN
    VUE_PLANS_DETAILLE p ON f.plan_id = p.plan_id
GROUP BY
    p.nom_plan
ORDER BY
    benefice_net DESC;


SELECT
    t.periode_journee,
    t.tranche_horaire,
    COUNT(*) AS nb_transactions,
    AVG(f.duree_traitement_ms) AS temps_traitement_moyen_ms
FROM
    FAIT_TRANSACTIONS_DETAILLE f
JOIN
    VUE_TEMPS_DETAILLE t ON f.heure_id = t.heure_id
GROUP BY
    t.periode_journee,
    t.tranche_horaire
ORDER BY
    t.tranche_horaire;


SELECT
    c.type_client,
    d.annee,
    d.nom_mois,
    SUM(f.montant_total) / COUNT(*) AS panier_moyen_estime,
    COUNT(*) AS nb_transactions
FROM
    FAIT_TRANSACTIONS_DETAILLE f
JOIN
    VUE_CLIENTS_DETAILLE c ON f.client_id = c.client_id
JOIN
    VUE_DATE_DETAILLE d ON f.date_id = d.date_id
GROUP BY
    c.type_client,
    d.annee,
    d.nom_mois,
    d.numero_mois
ORDER BY
    c.type_client,
    d.annee,
    d.numero_mois;
