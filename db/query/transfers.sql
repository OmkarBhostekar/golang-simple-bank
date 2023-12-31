-- name: CreateTransfer :one
INSERT INTO transfers(
    from_account_id,
    to_account_id,
    amount
) VALUES (
    $1,
    $2,
    $3
) RETURNING *;

-- name: GetTransferById :one
SELECT * FROM transfers WHERE id = $1 LIMIT 1;

-- name: GetAllTransfers :many
SELECT * FROM transfers;

-- name: DeleteTransferById :exec
DELETE FROM transfers
WHERE id = $1;

-- name: GetTransfersByFromAccountId :many
SELECT * FROM transfers
WHERE from_account_id = $1;

-- name: GetTransfersByToAccountId :many
SELECT * FROM transfers
WHERE to_account_id = $1;

-- name: GetTransfersByFromAccountIdAndToAccountId :many

SELECT * FROM transfers
WHERE from_account_id = $1
AND to_account_id = $2;
