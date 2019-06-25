package model

import (
	"time"
	"github.com/jinzhu/gorm"
	)
// gorm.Model definition
type Model struct {
	CreatedAt time.Time
	UpdatedAt time.Time
	DeletedAt *time.Time
}

// BeforeInsert hook executed before database insert operation.
func (p *Model) BeforeInsert(scope *gorm.Scope) error {
	scope.SetColumn("CreatedAt", time.Now())
	return nil
}

// BeforeUpdate hook executed before database update operation.
func (p *Model) BeforeUpdate(scope *gorm.Scope) error {
	scope.SetColumn("UpdatedAt", time.Now())
	return nil
}